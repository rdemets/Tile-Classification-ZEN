//title = getTitle();
//IJ.renameResults(title,"Results");

x_corr = newArray();
y_corr = newArray();
classes = newArray();
index = newArray();
roiManager("reset")

for (i=0; i<nResults; i++){
//for (i=0; i<5; i++){
  temp = getResultString("TileName",i);
  SplitTitle = split(temp,"-");
  x_coor_temp = split(SplitTitle[0],"x");
  x_value = parseInt(x_coor_temp[1]);
  x_corr = Array.concat(x_corr,x_value);

  y_coor_temp = split(SplitTitle[1],"y"); 
  y_value = parseInt(y_coor_temp[1]);
  y_corr = Array.concat(y_corr,y_value);
  
  class_temp = getResult("MainClass",i);
  classes = Array.concat(classes,class_temp);
  
  index_temp = split(SplitTitle[2],"m");
  index_temp2 = split(index_temp[1],"_");
  index = Array.concat(index,parseInt(index_temp2[0]));
}

Array.getStatistics(x_corr, minimum, maximum, mean);
x_max = maximum;
Array.getStatistics(y_corr, minimum, maximum, mean);
y_max = maximum;

temp2 = getResultString("TileName",0);
SplitTitle2 = split(temp2,"-");
sizex_temp = split(SplitTitle2[1],"y");
x_size = parseInt(sizex_temp[0]);

sizey_temp = split(SplitTitle2[2],"m");
y_size = parseInt(sizey_temp[0]);


//
newImageSizex = x_max + x_size;
newImageSizey = y_max + y_size;


newImage("Segmentation", "8-bit black", newImageSizex, newImageSizey, 1);

for (j=0; j<nResults; j++){
	makeRectangle(x_corr[j], y_corr[j], x_size, y_size);
	roiManager("Add");
	roiManager("Select", j);
	roiManager("Rename", index[j]);
	if (classes[j]==0)
		roiManager("Set Fill Color", "orange");
	else{ 
		if (classes[j]==1)
			roiManager("Set Fill Color", "cyan");
		else
			roiManager("Set Fill Color", "red");
	}
}
//roiManager("Show All");
roiManager("Show All with labels");
	

