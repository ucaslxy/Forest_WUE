library(terra)
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
