
Context = {}

function buildMap()
	Context.currmap = {
		'+^^^^^^^^^^^^^^+',
		'+              +',
		'+^^^^       ^^^+',
		'+              +',
		'+  __          +',
		'+  __          +',
		'+              +',
		'+              +',
		'+              +',
		'^^^^^^^^^^^^^^^^'
	}
end

function love.load()
	Context.tileval = ' +^_'
	Context.tilepng = love.graphics.newImage('res/tiles.png')
	Context.tilemap = {}

	buildMap()

	for j = 0, 10 do
		for i = 0, 10 do
			Context.tilemap[(10 * j) + i] = love.graphics.newQuad(
				16 * i, -- x
				16 * j, -- y
				16,		-- width
				16,		-- height
				320,	-- reference width
				320		-- reference height
			)
		end
	end
end

function love.draw()
	for i, line in ipairs(Context.currmap) do
		for n = 1, #line do
			local char = line:sub(n, n)
			local index = Context.tileval:find(char, nil, true)
			love.graphics.print(index, n * 16, i * 16)
			love.graphics.draw(Context.tilepng, Context.tilemap[index - 1], n * 16, i * 16)
		end
	end
end