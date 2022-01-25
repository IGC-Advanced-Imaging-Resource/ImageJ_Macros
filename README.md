# ImageJ_Macros

ImageJ and FIJI macros written for users of the IGC AIR facility.
All macros in this repository are written in IJ1 macro language

Keep reading for some help with using the scripts.

# How to use an ImageJ/FIJI Macro

Please note that FIJI stands for FIJI Is Just ImageJ and it is a version of ImageJ which includes a huge number of useful plugins for biological microscopy. The macros written within the IGC AIR facility always assume you are using FIJI and may not work using plain ImageJ. The macro will also have "installation" instructions at the top that will describe any update sites or plugins that are needed.

Macros can be written in a number of languages. The ones written by the facility are in the IJ1 language unless otherwise stated.

**Opening a macro**
*	To open a macro, drag and drop the .ijm file onto the FIJI toolbar (as you do for an image). This will open the macro in the script editor window.
*	If you want to copy and paste code in to the macro window, open it by going to “Plugins” > “New” > Macro. Check the correct language (likely IJ1) is selected in the “Language” menu

**Getting familiar with the macro**
*	It’s a good idea to read through the macro, particularly any green text as this indicates notes left to help you understand what the macro is doing. It may also indicate where there are parameters you might want to adjust to optimise your analysis.

**Running the macro**
*	To start a macro, click the “Run” button in the bottom left of the script editor, below the macro text. 
*	Almost every macro created within the facility will ask you for an input folder which will contain your images. Every file format created in the facility should be supported by all macros. You will also often be asked for a folder where to save your results also.
*	Depending on the macro, other input may be required of you. It should be obvious what that is doing.
*	If you want to run the image on your open image, make sure you have the image (and no other images) open before you click the “Run” button on the macro window. This will let the macro know you want to run the analysis on the open image. 

**Running the macro** straight from Github
* Go to the macro you want here on Github.
* An example macro is here - https://github.com/IGC-Advanced-Imaging-Resource/ImageJ_Macros/blob/master/Test_to_run_from_Github.ijm
* If you click the "raw" button near the top right of the top of the code you will go to a new page where the script code is shown in raw form
* Copy the URL of that page and replace the URL within quotes below

> url = "https://raw.githubusercontent.com/IGC-Advanced-Imaging-Resource/ImageJ_Macros/master/Test_to_run_from_Github.ijm";  
> macrotext = File.openUrlAsString(url);  
> eval(macrotext);  

* Open ImageJ on your computer, open a script window by going to “Plugins” > “New” > Macro and copy the above three lines (with your changed URL). 
* Click the run button in the bottom left
* Success!
