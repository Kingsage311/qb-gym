QBCore = exports['qb-core']:GetCoreObject()
local training = false
local resting = false

local function CheckTraining()
	if resting == true then
        QBCore.Functions.Notify('You\'re resting', 'primary')
		resting = false
		Wait(Config.RestingTime * 1000)
		training = false
	end
	if resting == false then
        QBCore.Functions.Notify('You can now do exercise again', 'success')
	end
end
--------------------------------------------------------------------------------------------------------------------
local function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


CreateThread(function()
    for _, v in pairs(Config.Blips) do
	local blip = AddBlipForCoord(v.coords)
	SetBlipSprite(blip, v.sprite)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 7)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(v.name)
	EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    while true do
            local sleep = 1000
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            for k in pairs(Config.Locations) do
                local dist = #(pos - vector3(Config.Locations[k].coords.x, Config.Locations[k].coords.y, Config.Locations[k].coords.z))
                if dist < 4.5 then
                    if dist < Config.Locations[k].viewDistance then
                        sleep = 0
                        DrawText3D(Config.Locations[k].coords.x, Config.Locations[k].coords.y, Config.Locations[k].coords.z, Config.Locations[k].Text3D)
                        if IsControlJustReleased(0, 38) then
                                QBCore.Functions.Notify('Preparing exercise', 'success')
                                Wait(1000)
                                    SetEntityHeading(ped, Config.Locations[k].heading)
                                    SetEntityCoords(ped, Config.Locations[k].coords.x, Config.Locations[k].coords.y, Config.Locations[k].coords.z - 1)
                                    TaskStartScenarioInPlace(ped, Config.Locations[k].animation, 0, true)
                                    Wait(30000)
                                    ClearPedTasks(ped)
                                    for _, v in pairs(GetGamePool('CObject')) do
                                        if IsEntityAttachedToEntity(ped, v) then
                                            SetEntityAsMissionEntity(v, true, true)
                                            DeleteObject(v)
                                            DeleteEntity(v)
                                        end
                                    end
                                    ClearAreaOfObjects(pos, 2.0, 0)
									exports["qb-skillz"]:UpdateSkill(Config.Locations[k].skill, Config.Locations[k].SkillAddQuantity)
									if Config.Debug then
                                    print(Config.Locations[k].skill, Config.Locations[k].SkillAddQuantity)
									end
                                    QBCore.Functions.Notify('You need to rest '..Config.RestingTime..' more seconds before doing another exercise', 'error')
                                    training = true
                                    resting = true
                                    CheckTraining()
                            elseif training == true then
                                QBCore.Functions.Notify('You need a break', 'primary')
                                resting = true
                                CheckTraining()
                        end
                    end
                end
            end
		Wait(sleep)
    end
end)