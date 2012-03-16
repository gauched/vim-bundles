function! ExportOutlineToWord()
ruby << EOF

	require 'win32ole'

	class Outline
		attr_accessor :tokens

		def initialize
			@tokens = []
		end

		class Chunk
			attr_accessor :style, :text

			def initialize(input)
			# This is sloppy, but whatever...
				indent = 0

				if input =~ /^\s*\:\s/
					prestyle = 'Body Text '
					input.sub!(/: /, '')
				else
					prestyle = 'Heading '
					indent = 1
				end

				for i in 0..8
					if input =~ /^\t{#{i}}/
						@style = prestyle + (i + indent).to_s
					end
				end
				@style = 'Body Text' if @style == 'Body Text 0'
				# Remove the tabs and base the indent on the word template
				@text = input.sub(/^\s*/, '') + "\n"
			end
		end

		def chunk(input)
			c = Chunk.new(input)
			if @tokens.last.nil? or @tokens.last.style != c.style
				@tokens << c
			else
				if @tokens.last.style =~ /Body/
					# Remove the newline from the last body text so the line wraps.
					@tokens.last.text = @tokens.last.text.chomp
					c.text = c.text.sub(/^\s*/, ' ')
				end
				@tokens.last.text += c.text
			end
		end
	end


	# Parse the buffer into an outline (array of tokens)
	buf = VIM::Buffer.current

	outline = Outline.new
	for i in 1..buf.count
		if buf[i] =~ /.+/	# skip blank lines
			outline.chunk(buf[i])
		end
	end


	# Put the outline in word.
	word = WIN32OLE.new('word.application')
	word['Visible'] = true
	doc = word.Documents.Add("h:/outline.dot")
	doc.Activate()

	daBegin = 0
	daEnd = 1	# a document starts with '\n'

	outline.tokens.each do |t|
			doc.Content.InsertAfter(t.text)
			daEnd = doc.Content.End
			doc.Range(daBegin, daEnd).Style = t.style
			daBegin = doc.Content.End + 1	# set it for the next run.
	end

EOF
endfunction

map <Leader>eow :call ExportOutlineToWord()<CR>
