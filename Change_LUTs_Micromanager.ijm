/* 
 * Use this macro to change the channel colours if they were read wrongly by ImageJ  
 * James Iremonger, Advanced Imaging Resource, 30.07.25
 */
 
//--------------------------------//-----------------------------------------------------------------------------------
//-- Preparation steps: Input and output folders
//--------------------------------//-----------------------------------------------------------------------------------

input = getDirectory("Select the folder with your images"); // Select folders with your LIF files inside
output = getDirectory("Select the folder where you want to save the output"); // Select where you want your results saved

dirList = newArray();
dirList = getFileTree(input, dirList); // These two lines with the below function will find all .nd2 files (and ignore other files) in your selected folder including in all sub-folders

//--------------------------------//-----------------------------------------------------------------------------------
//-- Main loop
//--------------------------------//-----------------------------------------------------------------------------------

for (img = 0; img < dirList.length; img++) { 
	path = dirList[img];
	run("Bio-Formats Importer", "open=[" + path + "] autoscale color_mode=Composite concatenate_series rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	name = File.nameWithoutExtension;
	title = getTitle();
	if (img == 0){
	Dialog.create("Channels");
	Dialog.addMessage("Enter number of channels");
	Dialog.addNumber("Channels:", 0);
	Dialog.show;
	nChannels = Dialog.getNumber();
	labels = getChannelLabels(nChannels);}
	else{
	//Apply channel LUTs
		c = 1;
		for (i = 0; i < labels.length; i++) {
    	//print("Channel " + (i + 1) + ": " + labels[i]);
		Stack.setChannel(c);
		run(labels[i]);
		c = c+1;
    }	
	saveAs("Tiff", output + name + '.tif');
}
}
//Macro complete
Dialog.create("Progress"); 
Dialog.addMessage("Macro Complete!");
Dialog.show;

//--------------------------------//-----------------------------------------------------------------------------------
//-- Functions
//--------------------------------//-----------------------------------------------------------------------------------

function getFileTree(dir, fileTree){
	list = getFileList(dir);

	for(f = 0; f < list.length; f++){
		if (matches(list[f], "(?i).*\\.(ome.tif)$"))
			fileTree = Array.concat(fileTree, dir + list[f]);
		if(File.isDirectory(dir + File.separator + list[f]))
			fileTree = getFileTree(dir + list[f],fileTree);
	}
	return fileTree;
}

function getChannelLabels(nChannels) {
    labels = newArray(nChannels);

    Dialog.create("Enter Channel Labels");
    for (i = 1; i <= nChannels; i++) {
        Dialog.addString("Label for Channel " + i + ":", "");
    }
    Dialog.show();

    for (i = 1; i <= nChannels; i++) {
        labels[i - 1] = Dialog.getString();
    }

    return labels;
}