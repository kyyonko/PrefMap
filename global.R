library(shiny)

# データ読み込み
PrefMap <- read.csv("PrefMap.csv", header = T, stringsAsFactors = F)

# 年齢層のベクトルを用意しておく
ages <- c("age0_4(%)", "age5_9(%)", "age10_14(%)", "age15_19(%)", "age20_24(%)", "age25_29(%)", 
          "age30_34(%)", "age35_39(%)", "age40_44(%)", "age45_49(%)", "age50_54(%)", "age55_59(%)", 
          "age60_64(%)", "age65_69(%)", "age70_74(%)", "age75_79(%)", "age80_84(%)", "age85_89(%)", 
          "age90_94(%)", "age95_99(%)", "over100(%)", "unknown(%)")

# 列名調整
colnames(PrefMap) <- c("都道府県", "lon", "lat", ages)

# プルダウン用
ages_choice <- ages
names(ages_choice) <- ages_choice