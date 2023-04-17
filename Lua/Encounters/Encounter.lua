wavetimer = math.huge
enemies   = {"emptyMonster"}
nextwaves = {"mainWave"}

function EncounterStarting()
    NewAudio.Stop("src")
    State("DEFENDING")
end
