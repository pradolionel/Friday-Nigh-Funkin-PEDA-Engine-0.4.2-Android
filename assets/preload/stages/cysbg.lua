function onCreate()
	-- background shit
	makeLuaSprite('cysBG', 'cysBG', -500, -300);
	setLuaSpriteScrollFactor('cysBG', 0.9, 0.9);
	
	addLuaSprite('cysBG', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
