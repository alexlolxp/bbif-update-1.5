local xx = 420.95;
local yy = 700;
local xx2 = 1600;
local yy2 = 800;
local ofs = 35;
local followchars = true;
function onCreate()
	-- background shit
	makeLuaSprite('bg', 'da schoolhouse/piracy/piracy baldi/staticredbg', -600, -300);
	setLuaSpriteScrollFactor('bg', 0.2, 0.2);
	scaleObject('bg', 1.2, 1.2);
	
	makeLuaSprite('binary', 'da schoolhouse/piracy/piracy baldi/binarycodebg', -600, -300);
	setLuaSpriteScrollFactor('binary', 0.2, 0.2);
	scaleObject('binary', 1.2, 1.2);

	makeLuaSprite('bg3d', 'da schoolhouse/piracy/piracy baldi/3dbinary', -600, -300);
	setLuaSpriteScrollFactor('bg3d', 0.36, 0.36);
	scaleObject('bg3d', 1.2, 1.2);

	makeLuaSprite('glitchy', 'da schoolhouse/piracy/piracy baldi/bigF', -600, -300);
	setLuaSpriteScrollFactor('glitchy', 0.6, 0.6);
	scaleObject('glitchy', 1.2, 1.2);

	makeLuaSprite('floor', 'da schoolhouse/piracy/piracy baldi/neatfloor', -600, -200);
	scaleObject('floor', 1.3, 1.3);

	addLuaSprite('bg', false);
	addLuaSprite('binary', false);
	addLuaSprite('bg3d', false);
	addLuaSprite('glitchy', false);
	addLuaSprite('floor', false);
end

function onUpdate()
	if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
			end
			else
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	end
end

function goodNoteHit()
	if followchars == true then
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
		end
	end
end

function onEvent(name,value1,value2)
	if name == 'Teleport' then
		xx = 1600;
		yy = 700;
		xx2 = 420.95;
		yy2 = 800;
	end
	if name == 'Teleport Back' then
		xx = 420.95;
		yy = 700;
		xx2 = 1600;
		yy2 = 800;
	end
end