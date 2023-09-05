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

net = vgg16;
% figure
% plot(net)
% title('Architecture of VGG-16')
% set(gca, 'YLim', [150 170]);
 
 net.Layers(1)
net.Layers(end)

nume1 =(net.Layers(end).ClassNames);
[trainingSet, testSet] = splitEachLabel(imds, 0.3,'randomize');

imageSize = net.Layers(1).InputSize;

augmentedTrainingSet = augmentedImageDatastore(imageSize, ...
    trainingSet, 'ColorPreprocessing', 'gray2rgb');

augmentedTestSet = augmentedImageDatastore(imageSize,...
    testSet, 'ColorPreprocessing', 'gray2rgb');

w1 = net.Layers(2).Weights;
 w1 = mat2gray(w1);

% figure
% montage(w1)
% title('First Convolutional Layer Weight')

featureLayer = 'fc7';
trainingFeatures = activations(net,...
    augmentedTrainingSet, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');

trainingLabels = trainingSet.Labels;
classifier = fitcecoc(trainingFeatures, trainingLabels,...
    'Learner', 'Linear', 'Coding', 'onevsall', 'ObservationsIn','columns');

testFeatures = activations(net,...
    augmentedTestSet, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');

predictLabels = predict(classifier, testFeatures, 'ObservationsIn', 'columns');

testLabels = testSet.Labels;
confMat = confusionmat(testLabels, predictLabels);
confMat = bsxfun(@rdivide, confMat, sum(confMat,2));

mean(diag(confMat));

newImage = imread(fullfile('Image_7.jpg'));

ds = augmentedImageDatastore(imageSize,...
    newImage, 'ColorPreprocessing', 'gray2rgb');

imageFeatures = activations(net,...
   ds, featureLayer, 'MiniBatchSize', 32, 'OutputAs', 'columns');

label = predict(classifier, imageFeatures, 'ObservationsIn', 'columns');

sprintf('The loaded image belongs to %s class', label)

accuracy = mean(predictLabels == testSet.Labels);
disp(['Mean accuracy = ' num2str(accuracy)])





 