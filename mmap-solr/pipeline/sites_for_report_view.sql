 SELECT "Record_No",
    "SiteID",
    "Site_Num",
    "Site_Name",
    "Site_Short",
    "Site_Date",
    "Year_Recorded",
    "GIS_Code",
    "Env_Contxt",
    "Acces",
    "Vill_Name",
    "Village_ID",
    "NrPrimRv",
    "NrSecRv",
    "DimenA",
    "DimAOrient",
    "DimenB",
    "DimBOrient",
    "EstDepth",
    "Exc_Pri",
    "Point_Y",
    "Point_X",
    "UTM_X",
    "UTM_Y",
    "left"((((((((((((((
        CASE
            WHEN "Cave" = '-1'::integer::double precision THEN 'cave, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "Rockshelt" = '-1'::integer::double precision THEN 'rockshelter, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "OpenAir" = '-1'::integer::double precision THEN 'open air, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Hist_Vill" = '-1'::integer::double precision THEN 'historic village, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "AbandHabit" = '-1'::integer::double precision THEN 'built and abandoned, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Hist_Rel" = '-1'::integer::double precision THEN 'historic buddhist, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "BuddStruct" = '-1'::integer::double precision THEN 'buddhist structures, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "NonBuddh" = '-1'::integer::double precision THEN 'religious, nonbuddhist, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "CurrHabit" = '-1'::integer::double precision THEN 'current habitation, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Jar_Site" = '-1'::integer::double precision THEN 'jar site, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Megalith" = '-1'::integer::double precision THEN 'houa phan, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Quarry" = '-1'::integer::double precision THEN 'quarry site, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN kiln_site = '-1'::integer::double precision THEN 'kiln site, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "RivCobSite" = '-1'::integer::double precision THEN 'river cobble site, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Surf_Scat" = '-1'::integer::double precision THEN 'surface scatter, '::text
            ELSE ''::text
        END, '-2'::integer) AS site_characteristics,
    "Site_Comm",
    "left"(((((((
        CASE
            WHEN "Speleo" = '-1'::integer::double precision THEN 'speleothems, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "Mean_Gall" = '-1'::integer::double precision THEN 'meandering galleries, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Platform" = '-1'::integer::double precision THEN 'platform, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Talus" = '-1'::integer::double precision THEN 'talus remains, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Riverbank" = '-1'::integer::double precision THEN 'riverbank exposure, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Mound" = '-1'::integer::double precision THEN 'mound, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Features" = '-1'::integer::double precision THEN 'features, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Strat" = '-1'::integer::double precision THEN 'stratigraphy, '::text
            ELSE ''::text
        END, '-2'::integer) AS site_conditions,
    "CvMthHt",
    "Cave_Fl",
    "CvMthDir",
    "CaveMoist",
    "Artdens",
    "CondComm",
    "left"((((((((
        CASE
            WHEN "SurfHabit" = '-1'::integer::double precision THEN 'surface structures, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "Garden" = '-1'::integer::double precision THEN 'cultivation, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "BatGuano" = '-1'::integer::double precision THEN 'bat guano digging, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "UXO" = '-1'::integer::double precision THEN 'UXO (unexploded bombs), '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "UXOCl" = '-1'::integer::double precision THEN 'UXO cleared, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Ordnance" = '-1'::integer::double precision THEN 'other ordnance, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Looting" = '-1'::integer::double precision THEN 'looting, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Erosion" = '-1'::integer::double precision THEN 'erosion, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "AnimAct" = '-1'::integer::double precision THEN 'animal activity, '::text
            ELSE ''::text
        END, '-2'::integer) AS recent_disturbance,
    "DistComm",
    "left"((((((((
        CASE
            WHEN "PrehistHab" = '-1'::integer::double precision THEN 'prehistoric habitation, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "HistOcc" = '-1'::integer::double precision THEN 'historic occupation, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Religious" = '-1'::integer::double precision THEN 'religious, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "MetalProd" = '-1'::integer::double precision THEN 'metal production, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "STtoolWork" = '-1'::integer::double precision THEN 'stone tool workshop, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "CeramProd" = '-1'::integer::double precision THEN 'ceramic production, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "LogCoffin" = '-1'::integer::double precision THEN 'log coffin, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "MortInter" = '-1'::integer::double precision THEN 'mortuary interments, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "MortCrem" = '-1'::integer::double precision THEN 'mortuary cremation, '::text
            ELSE ''::text
        END, '-2'::integer) AS past_site_functions,
    "PastFComm",
    "left"(((((((
        CASE
            WHEN "DrySwidden" = '-1'::integer::double precision THEN 'dryland agriculture/swidden, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "WetRice" = '-1'::integer::double precision THEN 'wet rice, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Orchards" = '-1'::integer::double precision THEN 'orchards, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "OtherHort" = '-1'::integer::double precision THEN 'other horticulture, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "FloodRec" = '-1'::integer::double precision THEN 'flood recession, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "CommFor" = '-1'::integer::double precision THEN 'commercial forest, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "NatFor" = '-1'::integer::double precision THEN 'natural forest, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Grasslnd" = '-1'::integer::double precision THEN 'grassland, '::text
            ELSE ''::text
        END, '-2'::integer) AS environment,
    "NatVeg",
    "Crops",
    "WldEdPl",
    "IndPlant",
    "Fauna",
    "EnvComm",
    "left"((((((((((((((
        CASE
            WHEN "STFlakes" = '-1'::integer::double precision THEN 'lithics - stone flakes, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "STCore" = '-1'::integer::double precision THEN 'lithics - stone core, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "PartPolish" = '-1'::integer::double precision THEN 'lithics - partly polished, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "FullPolish" = '-1'::integer::double precision THEN 'lithics - fully polished, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "PeckPolish" = '-1'::integer::double precision THEN 'lithics - pecked polished, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "CordEarth" = '-1'::integer::double precision THEN 'ceramics - earthenware - cordmarked, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "PlainEarth" = '-1'::integer::double precision THEN 'ceramics - earthenware - plain, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "DecEarth" = '-1'::integer::double precision THEN 'ceramics - earthenware - decorated, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "STware" = '-1'::integer::double precision THEN 'ceramics - stonware, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "CopperArt" = '-1'::integer::double precision THEN 'metal - copper base, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "IronArt" = '-1'::integer::double precision THEN 'metal - iron artifacts, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "AnimBone" = '-1'::integer::double precision THEN 'bone - animal, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "HumanBone" = '-1'::integer::double precision THEN 'bone - human, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "MiscBone" = '-1'::integer::double precision THEN 'bone - misc, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "Beads" = '-1'::integer::double precision THEN 'glass or stone bead, '::text
            ELSE ''::text
        END, '-2'::integer) AS artifacts_present,
    "Oth_Art",
    "ArtComm",
    "left"((((((
        CASE
            WHEN "GenView" = '-1'::integer::double precision THEN 'has general view, '::text
            ELSE ''::text
        END ||
        CASE
            WHEN "Panorama" = '-1'::integer::double precision THEN 'has panorama, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "MainFeat" = '-1'::integer::double precision THEN 'has main features view, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "ArtRange" = '-1'::integer::double precision THEN 'has artifact range view, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "ArtDense" = '-1'::integer::double precision THEN 'has artifact density view, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "CavePhoto" = '-1'::integer::double precision THEN 'has cave photo, '::text
            ELSE ''::text
        END) ||
        CASE
            WHEN "SpelPhoto" = '-1'::integer::double precision THEN 'has spel photo, '::text
            ELSE ''::text
        END, '-2'::integer) AS image_info,
    "ImageNos",
    "txtImageName1",
    "ImageComm",
    "SiteDesc",
    "River_Team",
    "Time_Spent",
    "Entered_By",
    "Initial_Date",
    "Last_Modified",
    "Visit_Comm",
    province,
    country,
    district,
    preform,
    alternative
   FROM "tblSite";
   
