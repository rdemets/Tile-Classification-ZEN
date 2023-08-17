# Motivations


The aim of this macro is to classify individual tiles based on their main content. 

## How to install

To install, drop the file in `Documents/Carl Zeiss/ZEN/Documents/Macros` folder.
## Requirements

This macro requires **Intellesis/Advanced Processing**.

## How to use

The macro will run on the active image. If no image is open, a prompt will ask to open an image. 
<br>The first channel of the middle plane will be extracted and ask the user to save the tiles manually. The function to export the tiles with the metadata cannot be recorded.
<br>Once done, click Ok and the second part of the macro will run, running the Intellesis pixel classifier on each tile, and performing pixel counting to classify the tile. The current code is very rigid in the sense that it works with 3 classes only (background, grey, white), but it could easily be improved.


## Improvements
<br>More flexibility on the classes could be made. A second macro exists performing the classification of the tiles only for sake of time. An ImageJ macro is given to visualize the result. This macro is also very rigid, since it works on creating substring at each `-`, so it could be broken very easily. 


## Updates history
(0.0.1) Initial commit
<br>(0.1.0) Make the process in two steps
