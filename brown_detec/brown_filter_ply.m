% Get file path
path = '/home/thomas/Documents/school/semester_3/5_Digital_Image_Processing/lab/LAI_detection';
bag_path = strcat(path, '/bag_parser/bag_files/HC_20231130_143832.bag');    addpath(genpath("./bag_parser/"));
ply_path = strcat(path, '/PLY_Files/High_Coverage/HC_20231130_143832.ply'); addpath(genpath("./PLY_Files/"));
% LC_20231130_152650
% MC_20231130_150501
% HC_20231130_143832


%% Setup reseach
% Load image and depth
[im, depth] = bag_parser(bag_path);
subplot(2, 1, 1); imshow(im); title('RGB');

[mask_a, mask_b] = brown_detect(im, 1);
subplot(2, 1, 2); imshow(mask_a); title('Filter');

ptCloud = pcread(ply_path);
%points3d =  ptCloud.Location.';
T=table(ptCloud.Location(:,1),ptCloud.Location(:,2),ptCloud.Location(:,3),'VariableNames',{'Var1' 'Var2' 'Var3'});
S=table2struct(T);

xyz = rosReadXYZ(S)
%xyz = rosReadXYZ(ptCloud,"PreserveStructureOnRead",true);
%fielddata = rosReadXYZ(ptCloud,"Datatype","double");