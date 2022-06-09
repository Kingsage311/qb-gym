
Config = {}

Config.RestingTime = 60 -- seconds between exercises

Config.Debug = true -- Debug prints

Config.Locations = {
    [1] = {--pull-ups
        coords = vector3(-1200.02, -1571.18, 4.61), heading = 215.53,
        animation = "prop_human_muscle_chin_ups", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do Pull-ups]", viewDistance = 2.5, WorkoutLabel = "Pull Ups",
    },
    [2] = {--arms
        coords = vector3(-1202.9837, -1565.1718, 4.63115), heading = 212.78,
        animation = "world_human_muscle_free_weights", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Use weights]", viewDistance = 2.5, WorkoutLabel = "Free Weights",
    },
    [3] = {--pushup
        coords = vector3(-1203.3242, -1570.6184, 4.631155), heading = 212.78,
        animation = "world_human_push_ups", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do push-ups]", viewDistance = 2.5, WorkoutLabel = "Pushups",
    },
    [4] = {--yoga
        coords = vector3(-1204.7958, -1560.1906, 4.63115), heading = 212.78,
        animation = "world_human_yoga", skill = "Lung Capacity", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do yoga]", viewDistance = 2.5, WorkoutLabel = "Yoga",
    },
    [5] = {--yoga
        coords = vector3(-1221.04, -1545.01, 4.69), heading = 212.78,
        animation = "world_human_yoga", skill = "Lung Capacity", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do yoga]", viewDistance = 2.0, WorkoutLabel = "Yoga",
    },
    [6] = {--yoga
        coords = vector3(-1217.09, -1543.43, 4.72), heading = 212.78,
        animation = "world_human_yoga", skill = "Lung Capacity", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Do yoga]", viewDistance = 2.5, WorkoutLabel = "Yoga",
    },
    [7] = {--Running
    coords = vector3(-1205.27, -1567.85, 4.6079), heading = 12.29,
    animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
    Text3D = "~b~E~w~ - [Do jogging]", viewDistance = 2.0, WorkoutLabel = "Jogging",
    },
}

Config.Blips = {
    [1] = {
        coords = vector3(-1201.97, -1568.06, 4.61), --blip coords
        sprite = 311, --blip sprite 311 is the defult gym icon
        colour = 38,
        name = "Beach Gym",
    },
}