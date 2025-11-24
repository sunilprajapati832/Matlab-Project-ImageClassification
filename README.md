# Matlab-Project-ImageClassification
## Project Overview
This repository contains the implementation and results of my Master’s thesis project: “Performance Comparison of CNN Architectures for Classification of Caltech-101 Image Dataset”. The project evaluates and compares the performance of four popular pretrained Convolutional Neural Network (CNN) architectures — AlexNet, ResNet-50, VGG-16 and VGG-19 — for image classification on the Caltech-101 dataset. The work demonstrates how pretrained CNNs can be used as feature extractors combined with a Support Vector Machine (SVM) classifier to achieve high accuracy without training networks from scratch.

## Objectives
- To implement multiple pretrained CNN architectures in MATLAB.
- To extract deep features from each network and train a multiclass SVM classifier.
- To evaluate classification accuracy on the Caltech-101 dataset.
- To compare the performance of AlexNet, ResNet-50, VGG-16 and VGG-19.

## Dataset - caltech-101 Downlaod link: 
**Caltech-101 Dataset** https://www.kaggle.com/datasets/imbikramsaha/caltech-101
- 9,146 images across 101 object categories + 1 background category.
- Each class contains ~40–800 images.
- Image size ~300 × 200 pixels.
- Categories include objects like airplanes, anchor, butterfly, chair, dolphin, elephant, etc.

## Methodology
**1. Dataset Preparation**
- Images loaded using MATLAB’s **imageDatastore**.
- Balanced dataset created using **splitEachLabel**.
- Augmented with **augmentedImageDatastore** for resizing and RGB conversion.

**2. Pretrained CNNs Used**
- AlexNet
- ResNet-50
- VGG-16
- VGG-19

**3. Feature Extraction**
- Extracted features from fully connected layers:
  * AlexNet → fc7
  * ResNet-50 → fc1000
  * VGG-16 → fc7
  * VGG-19 → fc8

**4. Classifier** 
- Trained a **multiclass SVM** (fitcecoc) using extracted features.

**5. Evaluation**
- Confusion matrix used for performance analysis.
- Accuracy calculated as mean of correctly classified labels.

## Comparison of MATLAB Classification Codes  
This table highlights the **AlexNet baseline** and the **differences** for ResNet50, VGG16, and VGG19, along with descriptions.
| **S.No.** | **AlexNet (Baseline)** | **ResNet50 (Differences only)** | **VGG16 (Differences only)** | **VGG19 (Differences only)** | **Code Description** |
|-----------|-------------------------|---------------------------------|------------------------------|------------------------------|-----------------------|
| 1 | `net = alexnet;` | `net = resnet50();` | `net = vgg16;` | `net = vgg19;` | Loads the respective pretrained CNN model. |
| 2 | `% plot(net) ... title('Architecture of AlexNet')` | `figure; plot(net); title('Architecture of ResNet-50');` | `% plot(net) ... title('Architecture of VGG-16')` | `% plot(net) ... title('Architecture of VGG-19')` | Plots the network architecture (active for ResNet50, commented for others). |
| 3 | `featureLayer = 'fc7';` | `featureLayer = 'fc1000';` | `featureLayer = 'fc7';` | `featureLayer = 'fc8';` | Defines which fully connected layer’s activations are used as features. |
| 4 | `newImage = imread('image_7.jpg');` | `newImage = imread('image_7.jpg');` | `newImage = imread('Image_7.jpg');` | `newImage = imread('Image_3a.jpg');` | Loads a test image for classification (filename differs). |
| 5 | `disp(['Mean accuracy = ' num2str(accuracy)])` | `disp(['Mean accuracy = ' num2str(accuracy * 100 )])` | `disp(['Mean accuracy = ' num2str(accuracy)])` | `disp(['Mean accuracy = ' num2str(accuracy)])` | Displays classification accuracy (ResNet50 shows percentage, others show fraction). |
| 6 | `% montage(w1) ... title('First Convolutional Layer Weight')` | `figure; montage(w1); title('First Convolutional Layer Weight');` | `% montage(w1) ... title('First Convolutional Layer Weight')` | `% montage(w1) ... title('First Convolutional Layer Weight')` | Visualizes first convolutional layer weights (active for ResNet50, commented for others). |

## Full AlexNet Code (Baseline)
```matlab
% MATLAB scripts
% classificationAlexNet.m
outputFolder = fullfile('caltech101');
rootFolder = fullfile(outputFolder, '101_ObjectCategories');
categories = {'accordion','airplanes','anchor','ant','BACKGROUND_Google','barrel','bass','beaver','binocular','bonsai','brain','brontosaurus','buddha','butterfly','camera','cannon','car_side','ceiling_fan','cellphone','chair','chandelier','cougar_body','cougar_face','crab','crayfish','crocodile','crocodile_head','cup','dalmatian','dollar_bill','dolphin','dragonfly','electric_guitar','elephant','emu','euphonium','ewer','Faces','Faces_easy','ferry','flamingo','flamingo_head','garfield','gerenuk','gramophone','grand_piano','hawksbill','headphone','hedgehog','helicopter','ibis', 'inline_skate','joshua_tree','kangaroo','ketch','lamp', 'laptop','Leopards','llama','lobster','lotus', 'mandolin','mayfly','menorah','metronome','minaret','Motorbikes', 'nautilus','octopus','okapi','pagoda','panda', 'pigeon', 'pizza', 'platypus', 'pyramid',  'revolver', 'rhino','rooster','saxophone', 'schooner', 'scissors', 'scorpion', 'sea_horse',  'snoopy', 'soccer_ball',  'stapler', 'starfish','stegosaurus', 'stop_sign','strawberry','sunflower', 'tick', 'trilobite', 'umbrella', 'watch', 'water_lilly','wheelchair', 'wild_cat','windsor_chair','wrench','yin_yang'};
imds = imageDatastore(fullfile(rootFolder,categories),'LabelSource','foldernames');
tb1 = countEachLabel(imds);
minSetCount = min(tb1{:,2});
imds = splitEachLabel(imds, minSetCount, 'randomize');
countEachLabel(imds);
accordion= find(imds.Labels == 'accordion', 1);
airplanes= find(imds.Labels == 'airplanes', 1);
anchor= find(imds.Labels == 'anchor', 1);
ant= find(imds.Labels == 'ant', 1);
BACKGROUND_Google= find(imds.Labels == 'BACKGROUND_Google', 1);
barrel= find(imds.Labels == 'barrel', 1);
bass= find(imds.Labels == 'bass', 1);
beaver= find(imds.Labels == 'beavers', 1);
binocular= find(imds.Labels == 'binocular', 1);
bonsai= find(imds.Labels == 'bonsai', 1);
brain= find(imds.Labels == 'brain', 1);
brontosaurus= find(imds.Labels == 'brontosaurus', 1);
buddha= find(imds.Labels == 'buddha', 1);
butterfly= find(imds.Labels == 'butterfly', 1);
camera= find(imds.Labels == 'camera', 1);
cannon= find(imds.Labels == 'cannon', 1);
car_side= find(imds.Labels == 'car_side', 1);
ceiling_fan= find(imds.Labels == 'ceiling_fan', 1);
cellphone= find(imds.Labels == 'cellphone', 1);
chair= find(imds.Labels == 'chair', 1);
chandelier= find(imds.Labels == 'chandelier', 1);
cougar_body= find(imds.Labels == 'cougar_body', 1);
cougar_face= find(imds.Labels == 'cougar_face', 1);
crab= find(imds.Labels == 'crab', 1);
crayfish= find(imds.Labels == 'crayfish', 1);
crocodile= find(imds.Labels == 'crocodile', 1);
crocodile_head= find(imds.Labels == 'crocodile_head', 1);
cup= find(imds.Labels == 'cup', 1);
dalmatian= find(imds.Labels == 'dalmatian', 1);
dollar_bill= find(imds.Labels == 'dollar_bill', 1);
dolphin= find(imds.Labels == 'dolphin', 1);
dragonfly= find(imds.Labels == 'dragonfly', 1);
electric_guitar= find(imds.Labels == 'electric_guitar', 1);
elephant= find(imds.Labels == 'elephant', 1);
emu= find(imds.Labels == 'emu', 1);
euphonium= find(imds.Labels == 'euphonium', 1);
ewer= find(imds.Labels == 'ewer', 1);
Faces= find(imds.Labels == 'Faces', 1);
Faces_easy= find(imds.Labels == 'Faces_easy', 1);
ferry= find(imds.Labels == 'ferry', 1);
flamingo= find(imds.Labels == 'flamingo', 1);
flamingo_head= find(imds.Labels == 'flamingo_head', 1);
garfield= find(imds.Labels == 'garfield', 1);
gerenuk= find(imds.Labels == 'gerenuk', 1);
gramophone= find(imds.Labels == 'gramophone', 1);
grand_piano= find(imds.Labels == 'grand_piano', 1);
hawksbill= find(imds.Labels == 'hawksbill', 1);
headphone= find(imds.Labels == 'headphone', 1);
hedgehog= find(imds.Labels == 'hedgehog', 1);
helicopter= find(imds.Labels == 'helicopter', 1);
ibis= find(imds.Labels == 'ibis', 1);
inline_skate= find(imds.Labels == 'inline_skate', 1);
joshua_tree= find(imds.Labels == 'joshua_tree', 1);
kangaroo= find(imds.Labels == 'kangaroo', 1);
ketch= find(imds.Labels == 'ketch', 1);
lamp= find(imds.Labels == 'lamp', 1);
laptop= find(imds.Labels == 'laptop', 1);
Leopards= find(imds.Labels == 'Leopards', 1);
llama= find(imds.Labels == 'llama', 1);
lobster= find(imds.Labels == 'lobster', 1);
lotus= find(imds.Labels == 'lotus', 1);
mandolin= find(imds.Labels == 'mandolin', 1);
mayfly= find(imds.Labels == 'mayflyr', 1);
menorah= find(imds.Labels == 'menorah', 1);
metronome= find(imds.Labels == 'metronome', 1);
minaret= find(imds.Labels == 'minaret', 1);
Motorbikes= find(imds.Labels == 'Motorbikes', 1);
nautilus= find(imds.Labels == 'nautilus', 1);
octopus= find(imds.Labels == 'octopus', 1);
okapi= find(imds.Labels == 'okapi', 1);
pagoda= find(imds.Labels == 'pagoda', 1);
panda= find(imds.Labels == 'panda', 1);
pigeon= find(imds.Labels == 'pigeon', 1);
pizza= find(imds.Labels == 'pizza', 1);
platypus= find(imds.Labels == 'platypus', 1);
pyramid= find(imds.Labels == 'pyramid', 1);
revolver= find(imds.Labels == 'revolver', 1);
rhino= find(imds.Labels == 'rhinor', 1);
rooster= find(imds.Labels == 'rooster', 1);
saxophone= find(imds.Labels == 'saxophone', 1);
schooner= find(imds.Labels == 'schooner', 1);
scissors= find(imds.Labels == 'scissors', 1);
scorpion= find(imds.Labels == 'scorpion', 1);
sea_horse= find(imds.Labels == 'sea_horse', 1);
snoopy= find(imds.Labels == 'snoopyr', 1);
soccer_ball= find(imds.Labels == 'soccer_ball', 1);
stapler= find(imds.Labels == 'stapler', 1);
starfish= find(imds.Labels == 'starfish', 1);
stegosaurus= find(imds.Labels == 'stegosaurus', 1);
stop_sign= find(imds.Labels == 'stop_sign', 1);
strawberry= find(imds.Labels == 'strawberry', 1);
sunflower= find(imds.Labels == 'sunflower', 1);
tick= find(imds.Labels == 'tick', 1);
trilobite= find(imds.Labels == 'trilobite', 1);
umbrella= find(imds.Labels == 'umbrella', 1);
watch= find(imds.Labels == 'watch', 1);
water_lilly= find(imds.Labels == 'water_lilly', 1);
wheelchair= find(imds.Labels == 'wheelchair', 1);
wild_cat= find(imds.Labels == 'wild_cat', 1);
windsor_chair= find(imds.Labels == 'windsor_chair', 1);
wrench= find(imds.Labels == 'wrench', 1);
yin_yang= find(imds.Labels == 'yin_yang', 1);
% figure
% subplot(2,2,1);
% imshow(readimage(imds,accordion));
% subplot(2,2,2);
% imshow(readimage(imds,airplanes));
% subplot(2,2,3);
% imshow(readimage(imds,anchor));
% subplot(2,2,4);
% imshow(readimage(imds,ant));
net = alexnet ;
% figure
% plot(net)
% title('Architecture of AlexNet')
% set(gca, 'YLim', [150 170]);
net.Layers(1)
net.Layers(end)
nume1 =(net.Layers(end).ClassNames);
[trainingSet, testSet] = splitEachLabel(imds, 0.3,'randomize');
imageSize = net.Layers(1).InputSize;
augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');
w1 = net.Layers(2).Weights;
w1 = mat2gray(w1);
% figure
% montage(w1)
% title('First Convolutional Layer Weight')
featureLayer = 'fc7';
trainingFeatures = activations(net, augmentedTrainingSet, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
trainingLabels = trainingSet.Labels;
classifier = fitcecoc(trainingFeatures, trainingLabels, 'Learner', 'Linear', 'Coding', 'onevsall', 'ObservationsIn','columns');
testFeatures = activations(net, augmentedTestSet, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
predictLabels = predict(classifier, testFeatures, 'ObservationsIn', 'columns');
testLabels = testSet.Labels;
confMat = confusionmat(testLabels, predictLabels);
confMat = bsxfun(@rdivide, confMat, sum(confMat,2));
mean(diag(confMat));
newImage = imread(fullfile('image_7.jpg'));
ds = augmentedImageDatastore(imageSize, newImage, 'ColorPreprocessing', 'gray2rgb');
imageFeatures = activations(net, ds, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');
label = predict(classifier, imageFeatures, 'ObservationsIn', 'columns');
sprintf('The loaded image belongs to %s class', label)
accuracy = mean(predictLabels == testSet.Labels);
disp(['Mean accuracy = ' num2str(accuracy)])
```

## Note:  
**AlexNet column** shows the entire baseline code. **ResNet50**, **VGG16**, **VGG19** columns show only the differences compared to AlexNet. Most preprocessing, dataset handling, training, and evaluation steps are identical across all four codes. The main differences are in:
- Network initialization (alexnet, resnet50, vgg16, vgg19)
- Feature layer selection (**fc7**, **fc1000**, **fc7**, **fc8**)
- Architecture plotting (enabled for ResNet50, commented for others)
- Test image filename (image_7.jpg, Image_7.jpg, Image_3a.jpg)
- Accuracy display formatting (ResNet50 multiplies by 100 to show percentage).

## Results
| Architecture | Feature Layer | Accuracy (Caltech-101) |
|--------------|---------------|-------------------------|
| AlexNet      | fc7           | 0.81478 – 0.80522 (~81%) |
| ResNet-50    | fc1000        | 0.88348 – 0.88261 (~88%) |
| VGG-16       | fc7           | 0.84957 – 0.86000 (~85%) |
| VGG-19       | fc8           | 0.82870 – 0.82435 (~82%) |

- **ResNet-50 achieved the highest accuracy (~88%)**, outperforming AlexNet, VGG-16, and VGG-19.  
- **AlexNet** performed reasonably well (~81%) but was surpassed by deeper architectures.  
- **VGG-16** showed strong performance (~85%), slightly better than VGG-19 (~82%).  
- The comparison highlights that **deeper residual networks (ResNet-50)** are more effective for complex datasets like Caltech-101, thanks to their skip connections and ability to train very deep architectures without vanishing gradients.

## Repository Structure
├── Images
├── MATLAB_Code_Files
    ├── classificationAlexNet.m   # Full code for AlexNet
    ├── classificationResNet50.m  # Code with ResNet-50 differences
    ├── classificationVGG16.m     # Code with VGG-16 differences
    ├── classificationVGG19.m     # Code with VGG-19 differences
├── README.md                     # Project documentation

## System Setup
- **OS:** Windows 7 (64-bit)
- **CPU:** Intel Core i3 @ 2.40GHz
- **RAM:** 3 GB
- **Software:** MATLAB R2018a
- **Toolboxes:**
   * Deep Learning Toolbox™
   * Statistics and Machine Learning Toolbox™
   * Pretrained CNN Models (AlexNet, ResNet-50, VGG-16, VGG-19)















