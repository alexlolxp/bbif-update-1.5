local xx = 450;
local yy = 700;
local xx2 = 1250;
local yy2 = 950;
local ofs = 35;
local followchars = true;
local uiRemoved = false;

function onCreate()
	makeLuaSprite('3Dbg', 'da schoolhouse/baldi/3D_bg', -600, -200);
	setLuaSpriteScrollFactor('3Dbg', 0.9, 0.9);
	
	makeLuaSprite('3Dchairs', 'da schoolhouse/baldi/3D_chairs', -600, -100);
	
	makeLuaSprite('3Dtable', 'da schoolhouse/baldi/3D_table', -600, -100);
	setLuaSpriteScrollFactor('3Dtable', 1.3, 1.3);

	makeLuaSprite('polyBG', 'da schoolhouse/baldi/poly_bg', -600, -200);
	setLuaSpriteScrollFactor('polyBG', 0.9, 0.9);

	makeLuaSprite('polyCHAIRS', 'da schoolhouse/baldi/poly_chairs', -600, -100);

	makeLuaSprite('polyTABLE', 'da schoolhouse/baldi/poly_table', -600, -100);
	setLuaSpriteScrollFactor('polyTABLE', 1.3, 1.3);

	makeAnimatedLuaSprite('filename', 'da schoolhouse/baldi/filenamebg', -100, 350);
	luaSpriteAddAnimationByPrefix('filename', 'static', 'static', 24, true);
	luaSpritePlayAnimation('filename', 'static');
	setLuaSpriteScrollFactor('filename', 1, 1);
	scaleObject('filename', 6, 6);

	addLuaSprite('3Dbg', false);
	addLuaSprite('3Dchairs', false);
	addLuaSprite('3Dtable', true);
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

	if followchars == false then
		if getProperty('dad.animation.curAnim.name') == 'singUP' then
			followchars = true;
		end
	end

	if uiRemoved == true then
		if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
			triggerEvent('ui add', 0.3);
			setProperty('defaultCamZoom',0.9);
		end
		if getProperty('dad.animation.curAnim.name') == 'singUP' then
			triggerEvent('ui add', 0.3);
			setProperty('defaultCamZoom',0.9);
		end
		if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
			triggerEvent('ui add', 0.3);
			setProperty('defaultCamZoom',0.9);
		end
		if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
			triggerEvent('ui add', 0.3);
			setProperty('defaultCamZoom',0.9);
		end
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then
		if value1 == 'math' then
			uiRemoved = true;
		end
		if value1 == 'good' then
			followchars = false;
		end
	end
end

function onStepHit()
	if songName == 'Expulsion' then
		if curStep == 16 then
			setProperty('defaultCamZoom',1);
		end
		if curStep == 144 then
			setProperty('defaultCamZoom',0.9);
		end
		if curStep == 198 then
			setProperty('defaultCamZoom',1.1);
		end
		if curStep == 208 then
			setProperty('defaultCamZoom',0.9);
		end
		if curStep == 296 then
			setProperty('defaultCamZoom',1);
		end
		if curStep == 302 then
			setProperty('defaultCamZoom',1.1);
		end
		if curStep == 304 then
			setProperty('defaultCamZoom',0.9);
		end
		if curStep == 400 then
			removeLuaSprite('3Dbg', false);
			removeLuaSprite('3Dchairs', false);
			removeLuaSprite('3Dtable', false);

			addLuaSprite('polyBG', false);
			addLuaSprite('polyCHAIRS', false);
			addLuaSprite('polyTABLE', true);

			setProperty('defaultCamZoom',0.8);
			setProperty('SONG.speed',2.9);

			triggerEvent('Change Character',1,'baldipixel');
			triggerEvent('Change Character',0,'poly-bf');

			setProperty('gf.visible', false);
			setProperty('boyfriend.y', 'boyfriend.y'-10);

			--xx = 450;
			--yy = 750;
			--yy2 = 850;
		end
		if curStep == 645 then
			setProperty('defaultCamZoom',1);
		end
		if curStep == 656 then
			setProperty('defaultCamZoom',0.8);
		end
		if curStep == 784 then
			setProperty('defaultCamZoom',0.9);
		end
		if curStep == 912 then
			xx = 840;
			xx2 = 840;
			yy = 825;
			yy2 = 825;

			removeLuaSprite('polyBG', true);
			removeLuaSprite('polyCHAIRS', true);
			removeLuaSprite('polyTABLE', true);
			
			addLuaSprite('filename', false);

			setProperty('dad.y', 0);

			setProperty('defaultCamZoom',0.75);
		end
		if curStep == 1292 then
			setProperty('defaultCamZoom',1.1);
		end
		if curStep == 1295 then
			setProperty('defaultCamZoom',0.85);
		end
		if curStep == 1424 then
			xx = 450;
			yy = 700;
			xx2 = 1250;
			yy2 = 950;

			addLuaSprite('3Dbg', false);
			addLuaSprite('3Dchairs', false);
			addLuaSprite('3Dtable', true);
			removeLuaSprite('filename', true);

			triggerEvent('Change Character',0,'bf');

			setProperty('defaultCamZoom',1);

			setProperty('boyfriend.y', 'boyfriend.y'+10);
		end
	end
	if songName == 'Basics' then
		if curStep == 2 then
			triggerEvent('ui remove',0.2);
			uiRemoved = true;
		end
	end
	if songName == 'Lesson' then
		if curStep == 2 then
			triggerEvent('ui remove',0.2);
			uiRemoved = true;
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