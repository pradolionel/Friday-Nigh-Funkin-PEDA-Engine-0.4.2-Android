local tankX = 400.0;
local tankSpeed = 0.0;
local tankAngle = 0.0;

function makeBGSprite(tag,image,x,y,scrollX,scrollY,animated)
    if (animated) then
        makeAnimatedLuaSprite(tag,image,x,y);
    else
        makeLuaSprite(tag,image,x,y);
    end
    setScrollFactor(tag,scrollX,scrollY);
end

function add(sprite,front) --Haxeflixel lel
    addLuaSprite(sprite,front);
end

function onCreate()
    tankSpeed = getRandomFloat(5,7);
    tankAngle = getRandomInt(-90,45);

    makeBGSprite('tankSky','tank/tankSky',-400,-400,0,0);
    add('tankSky',false);

    if (not lowQuality) then
        makeBGSprite('tankClouds','tank/tankClouds',getRandomFloat(-700,-100),getRandomFloat(-20,-20),0.2,0.2,false);
        setProperty('tankClouds.active',true);
        setProperty('tankClouds.velocity.x',getRandomFloat(5,15));
        add('tankClouds',false);
    
        makeBGSprite('tankMountains','tank/tankMountains',-300,-20,0.2,0.2,false);
        setGraphicSize('tankMountains',1.2*getProperty('tankMountains.width'));
        updateHitbox('tankMountains');
        add('tankMountains',false);
    
        makeBGSprite('tankBuildings','tank/tankBuildings',-200,0,0.3,0.3,false);
        setGraphicSize('tankBuildings',1.1*getProperty('tankBuildings.width'));
        updateHitbox('tankBuildings');
        add('tankBuildings',false);
    end

    makeBGSprite('tankRuins','tank/tankRuins',-200,0,0.35,0.35,false);
    setGraphicSize('tankRuins',1.1*getProperty('tankRuins.width'));
    updateHitbox('tankRuins');
    add('tankRuins',false);

    if (not lowQuality) then
        makeBGSprite('smokeLeft','tank/smokeLeft',-200,-100,0.4,0.4,true);
        addAnimationByPrefix('smokeLeft','SmokeBlurLeft instance','SmokeBlurLeft instance',24,true);
        add('smokeLeft',false);
    
        makeBGSprite('smokeRight','tank/smokeRight',1100,-100,0.4,0.4,true);
        addAnimationByPrefix('smokeRight','SmokeRight instance','SmokeRight instance',24,true);
        add('smokeRight',false);
    
        makeBGSprite('tankWatchtower','tank/tankWatchtower',100,50,0.5,0.5,true);
        addAnimationByPrefix('tankWatchtower','watchtower gradient color instance','watchtower gradient color instance',24,false);
        add('tankWatchtower',false);
    end

    makeBGSprite('tankRolling','tank/tankRolling',300,300,0.5,0.5,true);
    addAnimationByPrefix('tankRolling','BG tank w lighting','BG tank w lighting',24,true);
    add('tankRolling',false);

    makeBGSprite('tankGround','tank/tankGround',-420,-150,1,1,false);
    setGraphicSize('tankGround',1.15*getProperty('tankGround.width'));
    updateHitbox('tankGround');
    add('tankGround',false);
    moveTank(0);

    makeBGSprite('tank0','tank/tank0',-500,650,1.7,1.5,true);
    addAnimationByPrefix('tank0','fg','fg',24,false);
    add('tank0',true);

    if (not lowQuality) then makeBGSprite('tank1','tank/tank1',-300,750,2,0.2,true); end
    if (not lowQuality) then addAnimationByPrefix('tank1','fg','fg',24,false); end
    if (not lowQuality) then add('tank1',true); end

    makeBGSprite('tank2','tank/tank2',450,940,1.5,1.5,true);
    addAnimationByPrefix('tank2','foreground','foreground',24,false);
    add('tank2',true);

    if (not lowQuality) then makeBGSprite('tank4','tank/tank4',1300,900,1.5,1.5,true); end
    if (not lowQuality) then addAnimationByPrefix('tank4','fg','fg',24,false); end
    if (not lowQuality) then add('tank4',true); end

    makeBGSprite('tank5','tank/tank5',1620,700,1.5,1.5,true);
    addAnimationByPrefix('tank5','fg','fg',24,false);
    add('tank5',true);

    if (not lowQuality) then makeBGSprite('tank3','tank/tank3',1300,1200,3.5,2.5,true); end
    if (not lowQuality) then addAnimationByPrefix('tank3','fg','fg',24,false); end
    if (not lowQuality) then add('tank3',true); end
end

function moveTank(elapsed)
    if (not inCutscene) then
        tankAngle = tankAngle + elapsed * tankSpeed;
        setProperty('tankRolling.angle',tankAngle-90+15);
        setProperty('tankRolling.x',tankX + 1500 * math.cos(math.pi/180 * (1 * tankAngle + 180)));
        setProperty('tankRolling.y',1300+1100 * math.sin(math.pi/180 * (1 * tankAngle + 180)));
    end
end

function onUpdate(elapsed) 
    moveTank(elapsed);
end

function onBeatHit()
    if (curBeat % 2 == 0) then
        if (not lowQuality) then playAnim('tankWatchtower','watchtower gradient color instance',true); end

        playAnim('tank0','fg',true);
        if (not lowQuality) then playAnim('tank1','fg',true); end
        playAnim('tank2','foreground',true);
        if (not lowQuality) then playAnim('tank4','fg',true); end
        playAnim('tank5','fg',true);
        if (not lowQuality) then playAnim('tank3','fg',true); end
    end
end