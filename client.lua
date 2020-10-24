-----------------------------------------------

local menuzone = vector3(245.29, 370.21, 105.74)

local papercoords = vector3(1534.57, 1702.53, 109.71)

local tipscoords = vector3(601.16, -2806.35, 6.06)

local helpnot = "Um einen Joint zu bauen "

-----------------------------------------------

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_better-drugs:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- marker trash 1

local isInMarker = false
local hasAlreadyEnteredMarker = false

Citizen.CreateThread(function()

    while true do 
        isInMarker = false

        Citizen.Wait(1)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local zone = menuzone

        local distance = GetDistanceBetweenCoords(pedCoords, zone, true)

        if distance < 100 then
            DrawMarker(30, zone.x, zone.y, zone.z, 0.0, 0.0, 0.0, 0.0, 3.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 0, 50, false, true, 2, nil, nil, false)
        end

        if distance < (3 / 2) then
            isInMarker = true
            ESX.ShowHelpNotification("Drücke ~INPUT_PICKUP~ um das Joint Menu zu öffnen.")
        end

        if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
        end
        
        if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_schinken-rent:hasExitedMarker')
		end

    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local zone = menuzone

        local distance = GetDistanceBetweenCoords(pedCoords, zone, true)
     
        if IsControlJustReleased(0, 46) and distance < (3 / 2) then
            OpenJointMenu()
        end
    end
end)


function OpenJointMenu()
    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'rent_menu',
		{
			title    = "Joint Menu",
			align    = 'center',
			elements = {
                { label = "Hilfe", value = "help" },
                { label = "Paper Route", value = "paperroute"},
                { label = "Tips Route", value = "tipsroute"}
			}
        }, 
        function(data, menu)

            if data.current.value == "help" then
                ESX.ShowNotification(helpnot)

            elseif data.current.value == "paperroute" then
                SetNewWaypoint(papercoords.x, papercoords.y)
            elseif data.current.value == "tipsroute" then
                SetNewWaypoint(tipscoords.x, tipscoords.y)
            end

        end, function(data, menu)
            menu.close()
    end)
end


-----------------------------------------------------------------------------------------------------------------

-- PAPES
-- marker trash 2

local papes = 0

local isInMarker2 = false
local hasAlreadyEnteredMarker2 = false

Citizen.CreateThread(function()

    while true do 
        isInMarker2 = false

        Citizen.Wait(1)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local zone2 = papercoords

        local distance2 = GetDistanceBetweenCoords(pedCoords, zone2, true)

        if distance2 < 100 then
            DrawMarker(22, zone2.x, zone2.y, zone2.z, 0.0, 0.0, 0.0, 0.0, 3.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 255, 50, false, true, 2, nil, nil, false)
        end

        if distance2 < (3 / 2) then
            isInMarker2 = true
            ESX.ShowHelpNotification("Drücke ~INPUT_PICKUP~ um Papes herzustellen.")
        end

        if isInMarker2 and not hasAlreadyEnteredMarker2 then
			hasAlreadyEnteredMarker2 = true
        end
        
        if not isInMarker2 and hasAlreadyEnteredMarker2 then
			hasAlreadyEnteredMarker2 = false
			TriggerEvent('esx_better-drugs:hasExitedMarker')
		end

    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local zone2 = papercoords

        local distance2 = GetDistanceBetweenCoords(pedCoords, zone2, true)
     
        if IsControlJustReleased(0, 46) and distance2 < (3 / 2) then
            OpenPapesMenu()
        end
    end
end)

function OpenPapesMenu()
    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'rent_menu',
		{
			title    = "Papes Menu",
			align    = 'center',
			elements = {
                { label = "Papers herstellen (2x)", value = "papes"},
                { label = "---------------------"},
                { label = "Du hast aktuell " .. papes .. "Papes!"}
			}
        }, 
        function(data, menu)

            if data.current.value == "papes" then
                ProcessPapes()
            end

        end, function(data, menu)
            menu.close()
    end)
end

function ProcessPapes()

    local result = true
    result = exports["progressbar"]:createProgressBar("Stelle Papes her ...", 10)

    papes = papes + 2
    ESX.ShowNotification("Du hast nun " .. papes .. " Papes!")
    
end 


----------------------------------------------------------------------------------------------------------------

local tips = 0

local isInMarker3 = false
local hasAlreadyEnteredMarker3 = false

Citizen.CreateThread(function()

    while true do 
        isInMarker3 = false

        Citizen.Wait(1)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local zone3 = tipscoords

        local distance3 = GetDistanceBetweenCoords(pedCoords, zone3, true)

        if distance3 < 100 then
            DrawMarker(22, zone3.x, zone3.y, zone3.z, 0.0, 0.0, 0.0, 0.0, 3.0, 0.0, 1.0, 1.0, 1.0, 255, 128, 255, 50, false, true, 2, nil, nil, false)
        end

        if distance3 < (3 / 2) then
            isInMarker3 = true
            ESX.ShowHelpNotification("Drücke ~INPUT_PICKUP~ um Tips herzustellen.")
        end

        if isInMarker3 and not hasAlreadyEnteredMarker3 then
			hasAlreadyEnteredMarker3 = true
        end
        
        if not isInMarker3 and hasAlreadyEnteredMarker3 then
			hasAlreadyEnteredMarker3 = false
			TriggerEvent('esx_better-drugs:hasExitedMarker')
		end

    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local pedCoords = GetEntityCoords(PlayerPedId())
        local zone3 = tipscoords

        local distance3 = GetDistanceBetweenCoords(pedCoords, zone3, true)
     
        if IsControlJustReleased(0, 46) and distance3 < (3 / 2) then
            OpenTipsMenu()
        end
    end
end)

function OpenTipsMenu()
    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'rent_menu',
		{
			title    = "Tips Menu",
			align    = 'center',
			elements = {
                { label = "Tips herstellen (2x)", value = "tips"},
                { label = "---------------------"},
                { label = "Du hast aktuell " .. tips .. " Tips!"}
			}
        }, 
        function(data, menu)

            if data.current.value == "tips" then
                ProcessTips()
            end

        end, function(data, menu)
            menu.close()
    end)
end

function ProcessTips()
    local result = true
    result = exports["progressbar"]:createProgressBar("Stelle Tips her ...", 10)

    tips = tips + 2
    ESX.ShowNotification("Du hast nun " .. tips .. " Papes!")
end

