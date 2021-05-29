
function StartWoodCut(x,y,z)
    local playerPed = PlayerPedId()
    local pc = GetEntityCoords(playerPed)
    local pname = 'p_axe02x'
    local prop
    local boneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_Finger12")
    RequestAnimDict("amb_work@world_human_tree_chop@male_a@idle_b")
    while not HasAnimDictLoaded("amb_work@world_human_tree_chop@male_a@idle_b") do
        Citizen.Wait(100)
    end
    TaskTurnPedToFaceCoord(playerPed, x,y,z, 2000)
    Citizen.Wait(2000)
    TaskPlayAnim(playerPed, "amb_work@world_human_tree_chop@male_a@idle_b", "idle_f", 8.0, -8.0, -1, 1, 0, true, 0, false, 0, false)
    if IsPedMale(playerPed) then
        prop = CreateObject(GetHashKey(pname), pc.x, pc.y, pc.z + 0.2, true, true, true)
        AttachEntityToEntity(prop, playerPed,boneIndex, 0.200, -0.0, 0.5010, 1.024, -160.0, -70.0, true, true, false, true, 1, true)
    else
        prop = CreateObject(GetHashKey(pname), pc.x, pc.y, pc.z + 0.2, true, true, true)
        AttachEntityToEntity(prop, playerPed, 387, 0.03, -0.02, 0.61, 176.0, 3.0, 234.0, true, true, false, true, 1, true)
    end
    Citizen.Wait(30000)
    ClearPedTasks(playerPed)
    DeleteObject(prop)
end
--Usage: StarWoodCut(0.0,0.0,0.0) - change coords
