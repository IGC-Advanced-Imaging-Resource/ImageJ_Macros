# ImageJ_Macros

ImageJ and FIJI macros written for users of the IGC AIR facility. All macros in this repository are written in IJ1 macro language and assume you will use FIJI (rather than ImageJ)

# How to use an ImageJ/FIJI Macro

**Getting familiar with the macro**
*	It’s a good idea to read through the macro, particularly any green text as this indicates notes left to help you understand what the macro is doing. It will have installation links for FIJI and any update sites or plugins necessary. It will also indicate where there are parameters you might want to adjust to optimise your analysis.

**Downloading a .ijm macro file from Github**
* The best way of downloading .ijm files from Github is to download the whole repository
* To do this, click the arrow on the green 'Code' button in the top right and select 'Download Zip'
* Once downloaded, unzip the folder to extract the files.
*	Drag and drop the .ijm file you want to use onto the FIJI toolbar. This will open the macro in the script editor window.

**Copy and pasting a macro from Github**
*	Another option, is to copy and paste the code of your chosen macro in to the macro window of FIJI. 
*	Open the macro window by going to “Plugins” > “New” > Macro and paste the script in
*	Check the correct language (likely IJ1) is selected in the “Language” menu.

**Running the macro straight from Github**
* Go to the macro you want here on Github (example macro is here - https://github.com/IGC-Advanced-Imaging-Resource/ImageJ_Macros/blob/master/Test_to_run_from_Github.ijm)
* If you click the "raw" button near the top right of the top of the code you will go to a new page where the script code is shown in raw form
* Copy the URL of that page and replace the URL within quotes below

     > url = "https://raw.githubusercontent.com/IGC-Advanced-Imaging-Resource/ImageJ_Macros/master/Test_to_run_from_Github.ijm";  
     > macrotext = File.openUrlAsString(url);  
     > eval(macrotext);  
* Open FIJI on your computer, open a script window by going to “Plugins” > “New” > Macro and copy the above three lines (with your changed URL). 
* Click the run button in the bottom left
* Success!

**Starting the macro**
*	To start a macro, click the “Run” button in the bottom left of the script editor, below the macro text. 
*	Almost every macro created within the facility will ask you for an input folder which will contain your images. Every file format created in the facility should be supported by all macros. You will also often be asked for a folder where to save your results also.
*	If you want to run the image on your open image, make sure you have the image (and no other images) open before you click the “Run” button on the macro window. This will let the macro know you want to run the analysis on the open image. 




