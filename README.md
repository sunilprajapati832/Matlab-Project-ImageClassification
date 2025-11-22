# Matlab-Project-ImageClassification
In this work, pretrained deep learning CNNs are deployed based on feature extraction for training an image category classifier for image classifications of Caltech-101 image dataset. In two research structures are implemented, in first structure Caltech-101 image datasets is used to find accuracy for image category classifications of four pretrained CNN architectures (i.e. ResNet-50, AlexNet, VGG-16, and VGG-19). This dataset contains images of different categories for image classification. In the second research structure all different CNN architecture's performances are compared. Here both the research structures are deployed on CPU system, with same parameters (size, epochs) of different images and their accuracies are obtained.

## Dataset - caltech-101 Downlaod link: 
https://www.kaggle.com/datasets/imbikramsaha/caltech-101

 ```matlab
    % This is a simple MATLAB script
    x = 1:10;
    y = sin(x);
    plot(x, y);
    title('Sine Wave');
    xlabel('x');
    ylabel('sin(x)');
