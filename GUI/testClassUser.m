addpath bin
addpath log

class = testClass;
class.textLatenZien("Hallo");
class.Property1 = ", ik ben robbe"

class.textLatenZien("Hallo");

logger = Logger();

%% Play with parameter save and load
clc, clear;
%file = readstruct("params\defaultParamete.json", );
file.area_of_image = 5;
writestruct(file, "params\defaultParamete.json", "PrettyPrint",true)

%% Check for a file named defaultParameters.json

if exist("params\defaultParamets.json", "file")
    disp("I exist")
else
    disp("I dont exist")
end

%% check class ParameterExtractor
addpath bin
addpath params

data.area_of_image = 0;
data.total_height_pointcloud = 0.2;
data.total_layers_pointcloud = 2;
data.layer_thickness_pointcloud = 1;
data.show_layer_pointcloud = 1;
data.auto_rotate_norm = [0 0 1];
data.manual_plane_rotation_norm = [0 0 1];
data.green_threshold_a_star_mask = 0;
data.hidden_leaves_factor = 0;
data.parameter_file = "params\defaultParameters.json";
data.bag_file = "C:\Users\robel\Documents\GitHub\LAI_detection\High_Coverage\HC_20231130_143832.bag";
data.pointcloud_file = "C:\Users\robel\Documents\GitHub\LAI_detection\High_Coverage\HC_20231130_143832.ply";
data;

extractor = ParameterExtractor("defaultParameter.json", data);
pause
new_data = extractor.ReadData();
data.area_of_image = 5000;
extractor.WriteDataToFile(data, "test.json")

%% Pointcloud slicing tests
addpath bin
%clc ;
clear;
close all;
pointcloud = pcread("..\High_Coverage\HC_20231130_152757.ply");
clean_factor = 0.19;
% Wordt al gedaan in de App onder ApplyLayerDefButtonPushed
[model, inlierIndices, outlierIndices] = pcfitplane(pointcloud,clean_factor);
cleancloud = select(pointcloud, inlierIndices);

pcshow(cleancloud);

[slicedPointClouds, amountOfSlices, hidden_leave_factor] = SlicePointCloud(cleancloud,0.07);

Leaf_area_index = CalcLai(slicedPointClouds, 1280*720, 0.93, hidden_leave_factor);
fprintf("layers: %f, hidden_leave_factor: %f, LAI: %f, norm_plane: %s \r\n", amountOfSlices, hidden_leave_factor, Leaf_area_index, mat2str(model.Normal))
