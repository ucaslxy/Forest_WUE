library(terra)

pml_path = "D:/1PhDwork/1ForestWUE/2et/pml_et_500m_cn/pml_"

for(yr in 2001:2020){
  print(yr)
  pml_etc = rast(paste0(pml_path, "etc_", as.character(yr), ".tif"))
  pml_eti = rast(paste0(pml_path, "eti_", as.character(yr), ".tif"))
  pml_ets = rast(paste0(pml_path, "ets_", as.character(yr), ".tif"))
  
  pml_et = pml_etc + pml_eti + pml_ets
  out_name = paste0(pml_path, "et_", as.character(yr), ".tif")
  writeRaster(pml_et, out_name, overwrite=TRUE)
}
tmpFiles(current = TRUE, remove = TRUE)


gpp_path <- "D:/1PhDwork/1ForestWUE/1gpp/pml_gpp_500/pml_gpp_"
et_path <- "D:/1PhDwork/1ForestWUE/2et/pml_et_500m_cn/pml_et_"
wue_path <- "D:/1PhDwork/1ForestWUE/3wue/pml_wue_500m/pml_wue_"

for(yr in 2001:2020){
  print(yr)
  gpp <- rast(paste0(gpp_path, as.character(yr), '.tif'))
  et <- rast(paste0(et_path, as.character(yr), '.tif'))
  wue <- gpp / et
  wue_name <- paste0(wue_path, as.character(yr), '.tif')
  writeRaster(wue, wue_name, overwrite=TRUE)
}


gpp_path <- "D:/1PhDwork/1ForestWUE/1gpp/pml_gpp_500/pml_gpp_"
etc_path <- "D:/1PhDwork/1ForestWUE/2et/pml_et_500m_cn/pml_etc_"
out_path <- "D:/1PhDwork/1ForestWUE/4gpp_t/pml_gpp_t_"

for(yr in 2001:2020){
  print(yr)
  gpp <- rast(paste0(gpp_path, as.character(yr), '.tif'))
  etc <- rast(paste0(etc_path, as.character(yr), '.tif'))
  gpp_t <- gpp / etc
  gpp_t_name <- paste0(out_path, as.character(yr), '.tif')
  writeRaster(gpp_t, gpp_t_name, overwrite=TRUE)
}


et_path <- "D:/1PhDwork/1ForestWUE/2et/pml_et_500m_cn/pml_et_"
etc_path <- "D:/1PhDwork/1ForestWUE/2et/pml_et_500m_cn/pml_etc_"
out_path <- "D:/1PhDwork/1ForestWUE/5t_et/pml_t_et_"

for(yr in 2001:2020){
  print(yr)
  et <- rast(paste0(et_path, as.character(yr), '.tif'))
  etc <- rast(paste0(etc_path, as.character(yr), '.tif'))
  t_et <- etc / et
  t_et_name <- paste0(out_path, as.character(yr), '.tif')
  writeRaster(t_et, t_et_name, overwrite=TRUE)
}


planted_forest <- rast("D:/1PhDwork/1ForestWUE/0basedata/china_pf.tif")
plot(planted_forest)

wue_path <- "D:/1PhDwork/1ForestWUE/3wue/pml_wue_500m/pml_wue_"

for(yr in 2001:2020){
  wue <- rast(paste0(wue_path, as.character(yr), ".tif"))
  tmp_wue <- wue * planted_forest
  tmp_wue[tmp_wue == 0] <- NA
  tmp_wue[tmp_wue > 6] <- NA
  #tmp_ma <- as.matrix(tmp_wue)
  #print(mean(tmp_ma, na.rm = TRUE))
  out_name <- paste0(wue_path, as.character(yr), "_pf.tif")
  writeRaster(tmp_wue, out_name, overwrite=TRUE)
}


planted_forest <- rast("D:/1PhDwork/1ForestWUE/0basedata/china_pf.tif")
plot(planted_forest)

t_et_path <- "D:/1PhDwork/1ForestWUE/5t_et/pml_t_et_"

for(yr in 2001:2020){
  t_et <- rast(paste0(t_et_path, as.character(yr), ".tif"))
  tmp_t_et <- t_et * planted_forest
  tmp_t_et[tmp_t_et == 0] <- NA
  tmp_ma <- as.matrix(tmp_t_et)
  print(mean(tmp_ma, na.rm = TRUE))
}



gpp_t_path <- "D:/1PhDwork/1ForestWUE/4gpp_t/pml_gpp_t_"

for(yr in 2001:2020){
  gpp_t <- rast(paste0(gpp_t_path, as.character(yr), ".tif"))
  tmp_gpp_t <- gpp_t * planted_forest
  tmp_gpp_t[tmp_gpp_t == 0] <- NA
  #tmp_gpp_t[tmp_gpp_t > 10] <- NA
  #tmp_ma <- as.matrix(tmp_gpp_t)
  #print(mean(tmp_ma, na.rm = TRUE))
  #out_name <- paste0(gpp_t_path, as.character(yr), "_pf.tif")
  #writeRaster(tmp_gpp_t, out_name, overwrite=TRUE)
}


tmp <- rast(paste0(gpp_t_path, as.character(2001), "_pf.tif"))
tmp_agg <- aggregate(tmp, fact=10, fun=mean, na.rm = TRUE)
plot(tmp_agg)
out_name <- paste0(gpp_t_path, as.character(yr), "_pf_5km.tif")
writeRaster(tmp_agg, out_name, overwrite=TRUE)




# 

pf <- rast("D:/1PhDwork/1ForestWUE/0basedata/pf_mask.tif")

#p1 read mean gpp
gpp_path <- "D:/1PhDwork/1ForestWUE/1gpp/pml_gpp_500/pml_gpp_"


for(yr in 2001:2020){
  gpp <- rast(paste0(gpp_path, as.character(yr), ".tif"))
  tmp_gpp <- gpp * pf
  #tmp_gpp[tmp_gpp == 0] <- NA
  #tmp_gpp_t[tmp_gpp_t > 10] <- NA
  tmp_ma <- as.matrix(tmp_gpp)
  print(mean(tmp_ma, na.rm = TRUE))
  out_name <- paste0(gpp_path, as.character(yr), "_pf.tif")
  writeRaster(tmp_gpp, out_name, overwrite=TRUE)
}

for(yr in 2001:2020){
  gpp <- rast(paste0(gpp_path, as.character(yr), "_pf.tif"))
  gpp_5km <- aggregate(gpp, fact=10, fun=mean, na.rm = TRUE)
  out_name <- paste0(gpp_path, as.character(yr), "_pf_5km.tif")
  writeRaster(gpp_5km, out_name, overwrite=TRUE)
}


#p1 read mean et
et_path <- "D:/1PhDwork/1ForestWUE/2et/pml_et_500m/pml_et_"

for(yr in 2001:2020){
  et <- rast(paste0(et_path, as.character(yr), ".tif"))
  tmp_et <- et * pf
  #tmp_et[tmp_et == 0] <- NA
  #tmp_et_t[tmp_et_t > 10] <- NA
  tmp_ma <- as.matrix(tmp_et)
  print(mean(tmp_ma, na.rm = TRUE))
  out_name <- paste0(et_path, as.character(yr), "_pf.tif")
  writeRaster(tmp_et, out_name, overwrite=TRUE)
}

for(yr in 2001:2020){
  et <- rast(paste0(et_path, as.character(yr), "_pf.tif"))
  et_5km <- aggregate(et, fact=10, fun=mean, na.rm = TRUE)
  out_name <- paste0(et_path, as.character(yr), "_pf_5km.tif")
  writeRaster(et_5km, out_name, overwrite=TRUE)
}


#p1 read mean wue
wue_path <- "D:/1PhDwork/1ForestWUE/3wue/pml_wue_500m/pml_wue_"


for(yr in 2001:2020){
  wue <- rast(paste0(wue_path, as.character(yr), ".tif"))
  tmp_wue <- wue * pf
  #tmp_wue[tmp_wue == 0] <- NA
  #tmp_wue_t[tmp_wue_t > 10] <- NA
  tmp_ma <- as.matrix(tmp_wue)
  print(mean(tmp_ma, na.rm = TRUE))
  out_name <- paste0(wue_path, as.character(yr), "_pf.tif")
  writeRaster(tmp_wue, out_name, overwrite=TRUE)
}

for(yr in 2001:2020){
  wue <- rast(paste0(wue_path, as.character(yr), "_pf.tif"))
  wue_5km <- aggregate(wue, fact=10, fun=mean, na.rm = TRUE)
  out_name <- paste0(wue_path, as.character(yr), "_pf_5km.tif")
  writeRaster(tmp_wue, out_name, overwrite=TRUE)
}


#p1 read mean t/et
t_et_path <- "D:/1PhDwork/1ForestWUE/5t_et/pml_t_et_"


for(yr in 2001:2020){
  t_et <- rast(paste0(t_et_path, as.character(yr), ".tif"))
  tmp_t_et <- t_et * pf
  #tmp_t_et[tmp_t_et == 0] <- NA
  #tmp_t_et_t[tmp_t_et_t > 10] <- NA
  tmp_ma <- as.matrix(tmp_t_et)
  print(mean(tmp_ma, na.rm = TRUE))
  out_name <- paste0(t_et_path, as.character(yr), "_pf.tif")
  writeRaster(tmp_t_et, out_name, overwrite=TRUE)
}

for(yr in 2001:2020){
  t_et <- rast(paste0(t_et_path, as.character(yr), "_pf.tif"))
  t_et_5km <- aggregate(t_et, fact=10, fun=mean, na.rm = TRUE)
  out_name <- paste0(t_et_path, as.character(yr), "_pf_5km.tif")
  writeRaster(t_et_5km, out_name, overwrite=TRUE)
}


#p1 read mean gpp
gpp_t_path <- "D:/1PhDwork/1ForestWUE/4gpp_t/pml_gpp_t_"


for(yr in 2001:2020){
  gpp_t <- rast(paste0(gpp_t_path, as.character(yr), ".tif"))
  tmp_gpp_t <- gpp_t * pf
  #tmp_gpp_t[tmp_gpp_t == 0] <- NA
  #tmp_gpp_t_t[tmp_gpp_t > 10] <- NA
  tmp_ma <- as.matrix(tmp_gpp_t)
  print(mean(tmp_ma, na.rm = TRUE))
  out_name <- paste0(gpp_t_path, as.character(yr), "_pf.tif")
  writeRaster(tmp_gpp_t, out_name, overwrite=TRUE)
}

for(yr in 2001:2020){
  gpp_t <- rast(paste0(gpp_t_path, as.character(yr), "_pf.tif"))
  gpp_t_5km <- aggregate(gpp_t, fact=10, fun=mean, na.rm = TRUE)
  out_name <- paste0(gpp_t_path, as.character(yr), "_pf_5km.tif")
  writeRaster(gpp_t_5km, out_name, overwrite=TRUE)
}
