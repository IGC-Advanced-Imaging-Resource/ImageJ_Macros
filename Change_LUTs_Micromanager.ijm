/* 
 * Use this macro to change the channel colours if they were read wrongly by ImageJ  
 * Advanced Imaging Resource, 30.07.25
 */
 
//--------------------------------//-----------------------------------------------------------------------------------
//-- Preparation steps: Input and output folders
//--------------------------------//-----------------------------------------------------------------------------------

input = getDirectory("Select the folder with your images"); // Select the folder containing the original images 
output = getDirectory("Select the folder where you want to save the output"); // Select where you want your results saved

dirList = newArray();
dirList = getFileTree(input, dirList); 

//--------------------------------//-----------------------------------------------------------------------------------
//-- Main loop
//--------------------------------//-----------------------------------------------------------------------------------

for (img = 0; img < dirList.length; img++) { 
	path = dirList[img];
	run("Bio-Formats Importer", "open=[" + path + "] autoscale color_mode=Composite rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	name = File.nameWithoutExtension;
	name = substring(name, 0, lengthOf(name) - 4);
	title = getTitle();
	if (img == 0){
		Dialog.create("Channels");
		Dialog.addMessage("Enter number of channels");
		Dialog.addNumber("Channels:", 0);
		Dialog.show;
		nChannels = Dialog.getNumber();
		waitForUser('You will now be asked to choose the colour for each channel. Make sure that you enter the name correctly\n \nYou can check spellings by clicking Image > Color > Display LUTs \n \nClick OK to continue');
		labels = getChannelLabels(nChannels);
		}
//Apply channel LUTs
c = 1;
	for (i = 0; i < labels.length; i++) {
		Stack.setChannel(c);
		run(labels[i]);
		c = c+1;
    		}	
	saveAs("Tiff", output + name + '.tif');
	run("Close All");
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
		if (matches(list[f], "(?i).*\\.(ome.tif|tif)$"))
			fileTree = Array.concat(fileTree, dir + list[f]);
		if(File.isDirectory(dir + File.separator + list[f]))
			fileTree = getFileTree(dir + list[f],fileTree);
	}
	return fileTree;
}

function getChannelLabels(nChannels) {
    labels = newArray(nChannels);

    Dialog.create("Enter Channel Colours");
    for (i = 1; i <= nChannels; i++) {
        Dialog.addString("LUT for Channel " + i + ":", "");
    }
    Dialog.show();

    for (i = 1; i <= nChannels; i++) {
        labels[i - 1] = Dialog.getString();
    }

    return labels;
}
