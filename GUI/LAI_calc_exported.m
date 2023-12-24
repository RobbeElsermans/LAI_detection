classdef LAI_calc_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        LAIDetectionUIFigure          matlab.ui.Figure
        GridLayout4                   matlab.ui.container.GridLayout
        TabGroup                      matlab.ui.container.TabGroup
        ImportTab                     matlab.ui.container.Tab
        GridLayout                    matlab.ui.container.GridLayout
        ImportfilesPanel              matlab.ui.container.Panel
        GridLayout9                   matlab.ui.container.GridLayout
        CreatepointcloudfrombagfileCheckBox  matlab.ui.control.CheckBox
        SearchFileButton_3            matlab.ui.control.Button
        paramFile                     matlab.ui.control.EditField
        ParametersLabel               matlab.ui.control.Label
        ErrorLabel                    matlab.ui.control.Label
        LoadDataButton                matlab.ui.control.Button
        AreaofimagepixelsEditField    matlab.ui.control.NumericEditField
        AreaofimagepixelsEditFieldLabel  matlab.ui.control.Label
        SearchFileButton_2            matlab.ui.control.Button
        SearchFileButton              matlab.ui.control.Button
        plyFile                       matlab.ui.control.EditField
        content2_2                    matlab.ui.control.Label
        bagFile                       matlab.ui.control.EditField
        content2                      matlab.ui.control.Label
        RGBImg                        matlab.ui.control.UIAxes
        DepthImg                      matlab.ui.control.UIAxes
        ExamineTab                    matlab.ui.container.Tab
        TabGroup3                     matlab.ui.container.TabGroup
        PointcloudTab                 matlab.ui.container.Tab
        GridLayout5                   matlab.ui.container.GridLayout
        LayerdividerPanel             matlab.ui.container.Panel
        GridLayout7_2                 matlab.ui.container.GridLayout
        LayerSlicerButton             matlab.ui.control.Button
        AMOUNTOFSLICESLabel           matlab.ui.control.Label
        LayersLabel                   matlab.ui.control.Label
        LayerThicknessSpinner         matlab.ui.control.Spinner
        LayerThicknessmSpinnerLabel   matlab.ui.control.Label
        LayerPickerSpinner            matlab.ui.control.Spinner
        LayerPickerLabel              matlab.ui.control.Label
        ImageFilterPanel              matlab.ui.container.Panel
        GridLayout10                  matlab.ui.container.GridLayout
        ApplyLayerDefButton           matlab.ui.control.Button
        TotalHeightSpinner            matlab.ui.control.Spinner
        TotalHeightmSpinnerLabel      matlab.ui.control.Label
        AutoplanerotationPanel        matlab.ui.container.Panel
        GridLayout8                   matlab.ui.container.GridLayout
        ResetAutoRotationButton       matlab.ui.control.Button
        ZNormSwitch                   matlab.ui.control.Switch
        ZSwitchLabel                  matlab.ui.control.Label
        YNormSwitch                   matlab.ui.control.Switch
        YSwitchLabel                  matlab.ui.control.Label
        XNormSwitch                   matlab.ui.control.Switch
        XSwitchLabel                  matlab.ui.control.Label
        AutoRotateButton              matlab.ui.control.Button
        ManualplanerotationPanel      matlab.ui.container.Panel
        GridLayout7                   matlab.ui.container.GridLayout
        ApplyManualRotateButton       matlab.ui.control.Button
        ResetManualRotationButton     matlab.ui.control.Button
        x_rotationSpinner             matlab.ui.control.Spinner
        x_rotationSpinnerLabel        matlab.ui.control.Label
        y_rotationSpinner             matlab.ui.control.Spinner
        y_rotationSpinnerLabel        matlab.ui.control.Label
        z_rotationSpinner             matlab.ui.control.Spinner
        z_rotationSpinner_2Label      matlab.ui.control.Label
        PointCloudLayersView          matlab.ui.control.UIAxes
        DepthImgCorrected             matlab.ui.control.UIAxes
        ImageTab                      matlab.ui.container.Tab
        GridLayout6                   matlab.ui.container.GridLayout
        ExportsPanel_2                matlab.ui.container.Panel
        GridLayout9_4                 matlab.ui.container.GridLayout
        amaskButton                   matlab.ui.control.Button
        OriginalRGBButton             matlab.ui.control.Button
        RGBwidthamaskButton           matlab.ui.control.Button
        GreentresholdPanel            matlab.ui.container.Panel
        GridLayout11_2                matlab.ui.container.GridLayout
        GreenCover                    matlab.ui.control.NumericEditField
        GreenleaveLabel               matlab.ui.control.Label
        AStarThresholdSpinner         matlab.ui.control.Spinner
        greenthreshholdaLabel         matlab.ui.control.Label
        AStarMaskImage                matlab.ui.control.UIAxes
        OriginalImage                 matlab.ui.control.UIAxes
        GreenFilteredImage            matlab.ui.control.UIAxes
        LAITab                        matlab.ui.container.Tab
        GridLayout11                  matlab.ui.container.GridLayout
        ExportDataButton              matlab.ui.control.Button
        ParameterOverviewTable        matlab.ui.control.Table
        hiddenleavefactorLabel        matlab.ui.control.Label
        HIDDENLEAVESFACTORLabel       matlab.ui.control.Label
        SubLayerThicknessSpinner      matlab.ui.control.Spinner
        DistlayermLabel_2             matlab.ui.control.Label
        CALCULATEDLEAFAREALabel       matlab.ui.control.Label
        LeafAreaIndexLabel            matlab.ui.control.Label
        CalculateLeafAreaIndexButton  matlab.ui.control.Button
        MatrixLAITab                  matlab.ui.container.Tab
        GridLayout11_3                matlab.ui.container.GridLayout
        ExportDepthImageButton        matlab.ui.control.Button
        ReviewDepthButton             matlab.ui.control.Button
        RotateDepthButton             matlab.ui.control.Button
        SliceDepthRGBButton           matlab.ui.control.Button
        divisionsEditField            matlab.ui.control.NumericEditField
        Label                         matlab.ui.control.Label
        mrowsSpinner                  matlab.ui.control.Spinner
        mrowsSpinnerLabel             matlab.ui.control.Label
        ncolumnsSpinner               matlab.ui.control.Spinner
        ncolumnsSpinnerLabel          matlab.ui.control.Label
        ExportDataButton_2            matlab.ui.control.Button
        ParameterOverviewTable_2      matlab.ui.control.Table
        CalculateLeafAreaIndexondivisionsButton  matlab.ui.control.Button
        DivisionLAIDepthImage         matlab.ui.control.UIAxes
        AccelerationMeterTab          matlab.ui.container.Tab
        AccelerationOverviewPanel     matlab.ui.container.Panel
        GridLayout12                  matlab.ui.container.GridLayout
        UseCurrentButton              matlab.ui.control.Button
        SearchFileButton_4            matlab.ui.control.Button
        LoadDataButton_2              matlab.ui.control.Button
        content2_3                    matlab.ui.control.Label
        bagFile_2                     matlab.ui.control.EditField
        zdirectionLabel               matlab.ui.control.Label
        ydirectionLabel               matlab.ui.control.Label
        xdirectionLabel               matlab.ui.control.Label
        ZMeanAccelEditField           matlab.ui.control.NumericEditField
        meanEditField_3Label          matlab.ui.control.Label
        ZMaximalAccelEditField        matlab.ui.control.NumericEditField
        maximalEditField_3Label       matlab.ui.control.Label
        YMeanAccelEditField           matlab.ui.control.NumericEditField
        meanEditField_2Label          matlab.ui.control.Label
        YMaximalAccelEditField        matlab.ui.control.NumericEditField
        maximalEditField_2Label       matlab.ui.control.Label
        XMeanAccelEditField           matlab.ui.control.NumericEditField
        meanEditFieldLabel            matlab.ui.control.Label
        XMaximalAccelEditField        matlab.ui.control.NumericEditField
        maximalEditFieldLabel         matlab.ui.control.Label
        ConvertTab                    matlab.ui.container.Tab
        GridLayout_2                  matlab.ui.container.GridLayout
        ExportsPanel                  matlab.ui.container.Panel
        GridLayout9_3                 matlab.ui.container.GridLayout
        RGBButton                     matlab.ui.control.Button
        ColourDepthButton             matlab.ui.control.Button
        ConvertbagdepthtoplypointcloudPanel  matlab.ui.container.Panel
        GridLayout9_2                 matlab.ui.container.GridLayout
        UseConvertedPointcloudButton  matlab.ui.control.Button
        ConvertedPlyLocation          matlab.ui.control.EditField
        plyfileEditFieldLabel         matlab.ui.control.Label
        SaveAspointcloudButton        matlab.ui.control.Button
        SearchConvertBagFileButton    matlab.ui.control.Button
        ConvertBagFilePathField       matlab.ui.control.EditField
        bagfileEditFieldLabel         matlab.ui.control.Label
        ConvertedPointcloudImage      matlab.ui.control.UIAxes
        RGBDepthImage                 matlab.ui.control.UIAxes
        LogTab                        matlab.ui.container.Tab
        LogWindowArea                 matlab.ui.control.TextArea
        madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel  matlab.ui.control.Label
        Hyperlink                     matlab.ui.control.Hyperlink
    end


    properties (Access = private)
        logger              % Logger class
        parameter_extractor % Parameter class
        parameter_data      % The parameter data used in wole the app
        computed_data       % All the data computed by the program
        converted_data      % Data used in the converter tab
        matrix_lai_data     % Data used to calculate LAI on multiple points on the image


        log_retrieval_timer
    end

    methods (Access = private)

        % function ComputeBagData(app, bagData)
        %     curSelColor = select(bagData,'Topic','/device_0/sensor_1/Color_0/image/data');
        %     allImColor = readMessages(curSelColor, 'DataFormat', 'struct');
        %     app.computed_data.original_rgb_img = double(rosReadImage(allImColor{1}))/255.0;
        %     app.logger.WriteLog("Done computing bag data");
        %
        % end

        function DispImg(app, img, parent)
            imshow(img, 'Parent',parent);
            app.logger.WriteLog("Display image");
        end

        function DispImg3d(~, img, parent)
            surf(img, "EdgeColor","none", 'Parent', parent);
            app.logger.WriteLog("Display 3d image");
        end

        function data = ComputePlyData(app, ply_file)
            data = pcread(ply_file);
            %app.computed_data.original_pointcloud_img = plyData;
            app.logger.WriteLog("Done computing pointcloud data");
        end

        function DispPCImg(app, img, parent)
            pcshow(img, 'Parent',parent);
            app.logger.WriteLog("Display pointcloud image");
        end

        function cleancloud = SetTotalHeightDepth(app, pointcloud, height)
            app.logger.WriteLog(strcat("Set the total height of the pointcloud: ", num2str(height), "m"));
            [model,inlierIndices, ~] = pcfitplane(pointcloud,height);
            app.computed_data.model_pointcloud_img = model;
            cleancloud = select(pointcloud, inlierIndices); % Select the indices that are in the total_height region
        end

        function rotated_image = RotateDepthImage(app, model, image, reference)

            app.logger.WriteLog(strcat("Depth image norm: ", mat2str(app.computed_data.model_pointcloud_img.Normal)));

            tform = normalRotation(model,reference);

            app.logger.WriteLog(strcat("Rotation matrix: ", mat2str(tform.R)));

            rotated_image = pctransform(image,tform);

            app.logger.WriteLog("Done rotating depth image");
        end

        function lab_image = CreateLABImage(app, rgb_image)
            lab_image = rgb2lab(rgb_image);
            app.logger.WriteLog("Done converting rgb image to L*a*b*");
        end

        function a_star_component = GetAStarComponent(app, lab_image)
            % L* De intensiteit
            % L gaat van 0 (black) <-> 100 (white)
            % a* de verhouding van groen-rood
            % a gaat van -127 (groen) <-> 128 (rood)
            % b* de verhouding van blauw-geel
            % b gaat van -127 (blauw) <-> 128 (geel)
            a_star_component = lab_image(:,:,2);
            app.logger.WriteLog("Done extracting a* component");
        end

        function a_star_binarized = ApplyThresh(app, a_star_comp, threshold)
            a_star_binarized = zeros(size(a_star_comp));
            a_star_binarized(:,:) = (a_star_comp(:,:) < threshold);
            app.logger.WriteLog(strcat("Done tresholding a* component with threshold: ", num2str(threshold)));
        end

        function result = ApplyMaskOnImage(app, image, mask)
            result = bsxfun(@times, image, cast(mask, 'like', image));
            app.logger.WriteLog("Done applying mask on image");
        end

        function LogRetrieval(app, src, event)
            app.LogWindowArea.Value = app.logger.GetCurrentLogging;
            scroll(app.LogWindowArea, "bottom");
        end

        function ApplyAStarThresh(app)
            app.computed_data.lab_img = CreateLABImage(app, app.computed_data.original_rgb_img);
            app.computed_data.a_star_component = GetAStarComponent(app, app.computed_data.lab_img);

            app.computed_data.a_star_mask = ApplyThresh(app, app.computed_data.a_star_component, app.parameter_data.green_threshold_a_star_mask);
            DispImg(app, app.computed_data.a_star_mask, app.AStarMaskImage);

            app.computed_data.threshed_rgb_img = ApplyMaskOnImage(app, app.computed_data.original_rgb_img, app.computed_data.a_star_mask);
            DispImg(app, app.computed_data.threshed_rgb_img, app.GreenFilteredImage);

            app.computed_data.green_covered_percent = CalcGreenArea(app, app.computed_data.a_star_mask);

            app.GreenCover.Value = app.computed_data.green_covered_percent*100;

        end

        function ApplyLayerSelection(app, value)

            if app.computed_data.amount_pointcloud_layers == 0
                app.logger.WriteLog("No layer definition has been set");
                % No value has been set
            end

            if app.computed_data.amount_pointcloud_layers == 1
                app.logger.WriteLog("There is just 1 layer, so nothing to show more");
                % No value has been set
            end

            if value >= 1 && value <= app.computed_data.amount_pointcloud_layers
                % invert the value
                % value = (app.computed_data.amount_pointcloud_layers+1) - value;

                app.computed_data.layer_picker_pointcloud = value;
                % retrieve the specific pointcloud
                temp = app.computed_data.sliced_pointclouds{value};
                DispPCImg(app, temp, app.PointCloudLayersView)
            end
        end

        function results = CalcGreenArea(app, bin_image)

            % Determine the area covered by green leaves with props
            app.logger.WriteLog("Determine the covered green on a pecific binairy image");

            pix_count = sum(bin_image, 'all'); % Count everything where a 1 is.
            app.logger.WriteLog(strcat("Total amount of '1's in image: ", num2str(pix_count)));

            size_img = size(bin_image);
            area_img = size_img(1)*size_img(2);
            app.logger.WriteLog(strcat("Total image points: ", num2str(area_img)));

            norm_amount_green =  pix_count/ area_img; % normalized amount of green
            app.logger.WriteLog(strcat("Found the green percentage: ",num2str(norm_amount_green*100)));

            results = norm_amount_green; % To percentage
            app.logger.WriteLog("Done calculating amount of green in image");
        end

        function set_params(app, data)
            app.AreaofimagepixelsEditField.Value = data.area_of_image;
            app.TotalHeightSpinner.Value = data.total_height_pointcloud;
            % app.ApproxLayersSpinner.Value = data.total_layers_pointcloud;
            app.LayerThicknessSpinner.Value = data.layer_thickness_pointcloud;
            %app.ShowLayerSpinner.Value = data.show_layer_pointcloud;
            app.SubLayerThicknessSpinner.Value = data.sub_layer_thickness_pointcloud;

            app.XNormSwitch.Value = data.auto_rotate_norm(1);
            app.YNormSwitch.Value = data.auto_rotate_norm(2);
            app.ZNormSwitch.Value = data.auto_rotate_norm(3);

            app.x_rotationSpinner.Value = data.manual_plane_rotation_norm(1);
            app.y_rotationSpinner.Value = data.manual_plane_rotation_norm(2);
            app.z_rotationSpinner.Value = data.manual_plane_rotation_norm(3);

            app.AStarThresholdSpinner.Value = data.green_threshold_a_star_mask;


        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)

            addpath bin
            app.logger = Logger();
            app.parameter_data = struct( ...
                'area_of_image',1280*720, ...
                'total_height_pointcloud',0.2, ...
                'layer_thickness_pointcloud',0.15, ...
                'sub_layer_thickness_pointcloud',0.10, ...
                'param_1_hlf', 10, ...
                'auto_rotate_norm',[0 0 1], ...
                'manual_plane_rotation_norm',[0 0 1], ...
                'green_threshold_a_star_mask',0, ...
                'parameter_file',"params\defaultParameters.json", ...
                'bag_file',[], ...
                'pointcloud_file',[]);

            app.parameter_extractor = ParameterExtractor("defaultParameters.json", app.parameter_data);

            app.parameter_data = app.parameter_extractor.ReadData();
            app.logger.WriteLog(strcat("Define the default parameters from: ",app.parameter_data.parameter_file));
            set_params(app, app.parameter_data);

            app.paramFile.Value = app.parameter_data.parameter_file;
            app.plyFile.Value = app.parameter_data.pointcloud_file;
            app.bagFile.Value = app.parameter_data.bag_file;

            app.computed_data = struct( ...
                'raw_bag_data',[], ...
                'raw_ply_data',[], ...
                'original_rgb_img',[], ...
                'original_depth_img',[], ...
                'original_pointcloud_img',[], ...
                'corrected_pointcloud_img',[], ...
                'rotated_pointcloud_img',[], ...
                'model_pointcloud_img',[], ...
                'amount_pointcloud_layers',[], ...
                'sliced_pointclouds',[], ...
                'z_distance',[], ...
                'hidden_leave_factor',[], ...
                'lab_img',[], ...
                'green_covered_percent',[], ...
                'a_star_component',[], ...
                'a_star_mask',[], ...
                'threshed_rgb_img',[], ...
                'layer_picker_pointcloud',[], ...
                'amount_pointcloud_points',[], ...
                'lai',[], ...
                'table_data', [], ...
                'accel_measures',[]);

            app.converted_data = struct( ...
                'filepath_bag', [], ...
                'filepath_ply', [],...
                'original_rgb_img', [], ...
                'original_depth_img', [], ...
                'color_depth_img', [], ...
                'converted_pointcloud_img', [], ...
                'intrinsic_parameters', [525.0, 525.0, 319.5, 239.5] ...
                );

            app.matrix_lai_data = struct( ...
                'LAI', [], ...
                'used_columns', [], ...
                'used_rows', [], ...
                'green_factors',[], ...
                'height_factors', [], ...
                'original_depth', [], ...
                'normalized_depth',[], ...
                'a_star_mask', [], ...
                'sliced_rgb',[], ...
                'sliced_depth',[], ...
                'table_data', []...
                );

            app.log_retrieval_timer = timer("ExecutionMode","fixedRate","Period",5, ...
                "BusyMode","queue","TimerFcn",@app.LogRetrieval);

            if strcmp(app.log_retrieval_timer.Running,"off")
                start(app.log_retrieval_timer);
                app.logger.WriteLog("Start log timer");
            end

        end

        % Button pushed function: LoadDataButton
        function LoadFile(app, event)
            % reset the current values
            clc;

            app.logger.WriteLog("Loading file");

            %path = "ImgLoad/";
            app.parameter_data.bag_file = app.bagFile.Value;
            app.parameter_data.pointcloud_file = app.plyFile.Value;

            errorFlag = 0;

            try
                if errorFlag == 0 % If no error has occured so far
                    app.ErrorLabel.Visible = "off";
                    % app.computed_data.raw_bag_data = rosbag(app.parameter_data.bag_file);
                    %app.computed_data.raw_ply_data = pcread(app.parameter_data.pointcloud_file);

                    app.logger.WriteLog(strcat(".bag file: ", app.parameter_data.bag_file));
                    app.logger.WriteLog(strcat("pointcloud file: ", app.parameter_data.pointcloud_file));
                end
            catch error_message
                if errorFlag == 0  % If no error has occured so far
                    errorFlag = 1; % Set the error flag
                    app.ErrorLabel.Visible = "on"; % Show error when file not found
                    app.ErrorLabel.Text = "Something wrong with the given path.";
                    app.logger.WriteLogError( ...
                        strcat("Something wrong with the given path: bagfile=", app.parameter_data.bag_file, ", plyfile=", app.parameter_data.pointcloud_file), ...
                        error_message.message);
                end
            end
            %
            % try
            %     if errorFlag == 0 % If no error has occured so far
            %         app.ErrorLabel.Visible = "off";
            %         app.parameter_data.area_of_image = app.AreaofimagepixelsEditField.Value;
            %
            %         app.logger.WriteLog(strcat("given area per m²: ", num2str(app.parameter_data.area_of_image), "m²"));
            %     end
            %
            % catch error_message
            %     if errorFlag == 0  % If no error has occured so far
            %         errorFlag = 1; % Set the error flag
            %         app.ErrorLabel.Visible = "on"; % Show error when file not found
            %         app.ErrorLabel.Text = "Something wrong with area m²";
            %         app.logger.WriteLogError( ...
            %             strcat("Something wrong with area m²: ",num2str(app.AreaofimagepixelsEditField.Value)), ...
            %             error_message.message);
            %     end
            % end

            try
                if errorFlag == 0 % If no error has occured so far
                    app.ErrorLabel.Visible = "off";
                    app.logger.WriteLog("Start computing .bag data");
                    [app.computed_data.original_rgb_img, app.computed_data.original_depth_img, app.computed_data.accel_measures] = BagParser(app.parameter_data.bag_file);
                    % ComputeBagData(app, app.computed_data.raw_bag_data); % Compute the image as rgb and depth image and return this

                    % Set the area by rgb image resolution
                    app.parameter_data.area_of_image = size(app.computed_data.original_rgb_img, 1)*size(app.computed_data.original_rgb_img, 2);
                end

            catch error_message
                if errorFlag == 0 % If no error has occured so far
                    errorFlag = 1; % Set the error flag
                    app.ErrorLabel.Visible = "on"; % Show error when file not found
                    app.ErrorLabel.Text = "Can't compute .bag data";
                    app.logger.WriteLogError( ...
                        "Can't compute .bag data", ...
                        error_message.message);
                end
            end

            try
                if errorFlag == 0 % If no error has occured so far
                    app.ErrorLabel.Visible = "off";
                    app.logger.WriteLog("Start computing .ply data");
                    app.computed_data.original_pointcloud_img = ComputePlyData(app, app.parameter_data.pointcloud_file);
                end
            catch error_message
                if errorFlag == 0 % If no error has occured so far
                    errorFlag = 1; % Set the error flag
                    app.ErrorLabel.Visible = "on"; % Show error when file not found
                    app.logger.WriteLogError( ...
                        "Can't compute .ply data", ...
                        error_message.message);
                end
            end

            try
                if errorFlag == 0 % If no error has occured so far
                    app.ErrorLabel.Visible = "off";
                    app.logger.WriteLog("Start importing parameters");
                    app.parameter_extractor= app.parameter_extractor.setFilePath(app.paramFile.Value);
                    app.parameter_data = app.parameter_extractor.ReadData();

                    set_params(app, app.parameter_data);
                    app.logger.WriteLog("Set the parameters parameters");
                end
            catch error_message
                if errorFlag == 0 % If no error has occured so far
                    errorFlag = 1; % Set the error flag
                    app.ErrorLabel.Visible = "on"; % Show error when file not found
                    app.logger.WriteLogError( ...
                        "Can't import parameter data", ...
                        error_message.message);
                end
            end



            % https://www.mathworks.com/matlabcentral/answers/418893-how-to-display-an-image-in-ui-figure-on-app-designer
            if errorFlag == 0
                app.logger.WriteLog("Display images on Import & Examine tab");

                DispImg(app, app.computed_data.original_rgb_img, app.RGBImg);
                DispPCImg(app, app.computed_data.original_pointcloud_img, app.DepthImg);

                % set the images on the other tabs

                % Set Examine - Depth
                app.computed_data.corrected_pointcloud_img = SetTotalHeightDepth(app, app.computed_data.original_pointcloud_img, app.TotalHeightSpinner.Value);
                app.computed_data.rotated_pointcloud_img = app.computed_data.corrected_pointcloud_img;
                DispPCImg(app, app.computed_data.corrected_pointcloud_img, app.DepthImgCorrected);

                % Set Examine - Image
                DispImg(app, app.computed_data.original_rgb_img, app.OriginalImage)

                app.ApplyAStarThresh()
            end
        end

        % Button pushed function: SearchFileButton
        function SearchFileButtonPushed(app, event)
            % https://www.mathworks.com/help/matlab/ref/uigetfile.html
            try
                app.logger.WriteLog("Search For a file of .bag type");
                [file_path, canceled] = ImportFile('*.bag');

                if canceled
                    %disp('User selected Cancel');
                    app.logger.WriteLog("Cancel search (.bag)");
                    return;
                end

                %disp(['User selected ', fullfile(path,file)]);
                app.parameter_data.bag_file = file_path; %Transfer filepath
                app.bagFile.Value = file_path; % set filepath in editable field
                app.logger.WriteLog(strcat("selected path (.bag)", file_path));

            catch error_message
                %disp("something wrong with the file");
                app.logger.WriteLogError( ...
                        "something wrong with the selected path file (.bag)", ...
                        error_message.message);
            end
        end

        % Button pushed function: SearchFileButton_2
        function SearchFileButton_2Pushed(app, event)
            % https://www.mathworks.com/help/matlab/ref/uigetfile.html
            try
                app.logger.WriteLog("Search For a file of .ply type");
                [file_path, canceled] = ImportFile('*.ply');

                if canceled
                    %disp('User selected Cancel');
                    app.logger.WriteLog("Cancel search (.ply)");
                    return;
                end
                %disp(['User selected ', fullfile(path,file)]);
                app.parameter_data.pointcloud_file = file_path; %Transfer filepath
                app.plyFile.Value = file_path; % set filepath in editable field

                app.logger.WriteLog(strcat("selected path (.ply)", file_path));
            catch error_message
                %disp("something wrong with the file");
                app.logger.WriteLogError( ...
                        "something wrong with the selected path file (.ply)", ...
                        error_message.message);
            end

        end

        % Button pushed function: AutoRotateButton, 
        % ...and 1 other component
        function AutoRotateButtonPushed(app, event)
            % Automatic rotation

            reference_vector = [app.XNormSwitch.Value app.YNormSwitch.Value app.ZNormSwitch.Value];  % x=0, y=0, z=1
            app.logger.WriteLog(strcat("Auto rotate the depth image to norm: ", mat2str(reference_vector)));
            % If the vector is not 0,0,0
            if size(reference_vector(reference_vector(:) == 0),2) < 3
                % Set the manual rotation numbers correct
                app.x_rotationSpinner.Value = app.XNormSwitch.Value;
                app.y_rotationSpinner.Value = app.YNormSwitch.Value;
                app.z_rotationSpinner.Value = app.ZNormSwitch.Value;

                app.computed_data.rotated_pointcloud_img = RotateDepthImage(app, app.computed_data.model_pointcloud_img, app.computed_data.corrected_pointcloud_img, reference_vector);

                DispPCImg(app,app.computed_data.rotated_pointcloud_img, app.DepthImgCorrected)
            else
                app.logger.WriteLogError( ...
                    "The reference Vector is [0 0 0]", ...
                    mat2str(reference_vector));
            end

        end

        % Button pushed function: ResetAutoRotationButton
        function ResetAutoRotationButtonPushed(app, event)
            app.logger.WriteLog("Reset the rotation of the depth image.");

            app.XNormSwitch.Value = app.parameter_data.auto_rotate_norm(1);
            app.YNormSwitch.Value = app.parameter_data.auto_rotate_norm(2);
            app.ZNormSwitch.Value = app.parameter_data.auto_rotate_norm(3);

            app.x_rotationSpinner.Value = app.parameter_data.manual_plane_rotation_norm(1);
            app.y_rotationSpinner.Value = app.parameter_data.manual_plane_rotation_norm(2);
            app.z_rotationSpinner.Value = app.parameter_data.manual_plane_rotation_norm(3);

            app.computed_data.corrected_pointcloud_img = SetTotalHeightDepth(app, app.computed_data.original_pointcloud_img, app.TotalHeightSpinner.Value);
            DispPCImg(app, app.computed_data.corrected_pointcloud_img, app.DepthImgCorrected);


        end

        % Value changed function: AStarThresholdSpinner
        function AStarThresholdSpinnerValueChanged(app, event)
            value = app.AStarThresholdSpinner.Value;
            % When we alter the threshold, we need to recalculate the
            % threshold value for a* component
            app.logger.WriteLog(strcat("Perform an a* threshold with threshold: ", num2str(value)));
            app.parameter_data.green_threshold_a_star_mask = value;

            app.ApplyAStarThresh();


        end

        % Button pushed function: SearchFileButton_3
        function SearchFileButton_3Pushed(app, ~)
            try
                app.logger.WriteLog("Search For a file of .json type");
                [file_path, canceled] = ImportFile('*.json');

                if canceled
                    %disp('User selected Cancel');
                    app.logger.WriteLog("Cancel search (.json)");
                    return;
                end
                %disp(['User selected ', fullfile(path,file)]);
                app.parameter_data.parameter_file = file_path; %Transfer filepath
                app.paramFile.Value = file_path; % set filepath in editable field

                app.logger.WriteLog(strcat("selected path (.json)", file_path));
            catch error_message
                %disp("something wrong with the file");
                app.logger.WriteLogError( ...
                        "something wrong with the selected path file (.json)", ...
                        error_message.message);
            end

        end

        % Close request function: LAIDetectionUIFigure
        function LAIDetectionUIFigureCloseRequest(app, event)

            stop(app.log_retrieval_timer);
            app.logger.WriteLog("Stopped log retriever timer");
            app.logger.WriteLog("closing app");
            delete(app);

        end

        % Button pushed function: ApplyManualRotateButton
        function ApplyManualRotateButtonPushed(app, event)
            x = app.x_rotationSpinner.Value;
            y = app.y_rotationSpinner.Value;
            z = app.z_rotationSpinner.Value;

            reference_vector = [x y z];
            app.logger.WriteLog(strcat("Auto rotate the depth image to norm: ", mat2str(reference_vector)));
            % If the vector is not 0,0,0
            if size(reference_vector(reference_vector(:) == 0),2) < 3
                app.computed_data.rotated_pointcloud_img = RotateDepthImage(app, app.computed_data.model_pointcloud_img, app.computed_data.corrected_pointcloud_img, reference_vector);
                DispPCImg(app,app.computed_data.rotated_pointcloud_img, app.DepthImgCorrected)
            else
                app.logger.WriteLogError( ...
                        "The reference Vector is [0 0 0]", ...
                        mat2str(reference_vector));
            end

        end

        % Button pushed function: ApplyLayerDefButton
        function ApplyLayerDefButtonPushed(app, event)
            value = app.TotalHeightSpinner.Value;

            app.logger.WriteLog(strcat("Apply the layer definition with height: ", num2str(value)));

            % change the total thickness. This will cut out outliners
            app.parameter_data.total_height_pointcloud = value;

            app.logger.WriteLog("Do SetTotalHeightDepth");
            app.computed_data.corrected_pointcloud_img = SetTotalHeightDepth(app, app.computed_data.original_pointcloud_img, app.parameter_data.total_height_pointcloud);

            DispPCImg(app,app.computed_data.corrected_pointcloud_img, app.DepthImgCorrected);
        end

        % Value changed function: LayerPickerSpinner
        function LayerPickerSpinnerValueChanged(app, event)
            % View the layer created
            app.logger.WriteLog("Change the layer picker");
            value = app.LayerPickerSpinner.Value;

            ApplyLayerSelection(app, value)
        end

        % Button pushed function: LayerSlicerButton
        function LayerSlicerButtonPushed(app, event)
            app.parameter_data.total_height_pointcloud = app.LayerThicknessSpinner.Value;
            %app.parameter_data.sub_layer_thickness_pointcloud = thick;

            %Set the layer selection
            app.computed_data.layer_picker_pointcloud = 1;
            app.LayerPickerSpinner.Value = app.computed_data.layer_picker_pointcloud;

            app.logger.WriteLog("Do SlicePointCloud");


            [app.computed_data.sliced_pointclouds, app.computed_data.amount_pointcloud_layers, app.computed_data.z_distance] ...
                = SlicePointcloud( ...
                app.computed_data.rotated_pointcloud_img, ... % app.computed_data.corrected_pointcloud_img, ...
                app.parameter_data.total_height_pointcloud);

            app.logger.WriteLog(strcat("recieved from SlicePointCloud: \r\n",...
                "\t amount of slices: ", num2str(app.computed_data.amount_pointcloud_layers), ...
                "\r\n \t z-height: " , num2str(app.computed_data.z_distance)));

            app.logger.WriteLog("set Layers label");
            app.AMOUNTOFSLICESLabel.Text = num2str(app.computed_data.amount_pointcloud_layers);

            % set the min max layer picker range
            app.logger.WriteLog(strcat( ...
                "set the LayerPicker minimum and maximum range to ", mat2str([1, app.computed_data.amount_pointcloud_layers])));
            app.LayerPickerSpinner.Limits = [1, app.computed_data.amount_pointcloud_layers];

            ApplyLayerSelection(app, app.computed_data.layer_picker_pointcloud)


        end

        % Button pushed function: CalculateLeafAreaIndexButton
        function CalculateLeafAreaIndexButtonPushed(app, event)
            app.logger.WriteLog("Calculating LAI");
            app.parameter_data.sub_layer_thickness = app.SubLayerThicknessSpinner.Value;
            app.logger.WriteLog(strcat("Recieved sub thickness of a leave deck: ", num2str(app.parameter_data.sub_layer_thickness)));

            % calculate the hidden leave factor
            if app.computed_data.z_distance == 0
                % No Z-distance avaliable
                app.logger.WriteLogError("no z-distance avaliable", "Please go to the depth editation tab and apply a layer divider");
            else
                app.logger.WriteLog(strcat("Determine the hidden layer factor with a z-height of ", num2str(app.computed_data.z_distance)));
                app.computed_data.hidden_leave_factor = FindHiddenLeaveFactor(app.computed_data.z_distance, app.parameter_data.sub_layer_thickness, app.parameter_data.param_1_hlf);
                app.logger.WriteLog(strcat("Recieved a hidden layer factor of ", num2str(app.computed_data.hidden_leave_factor)));

                % Set value in label
                app.logger.WriteLog("set hidden leave factor label");
                app.HIDDENLEAVESFACTORLabel.Text = num2str(app.computed_data.hidden_leave_factor, 5);

                % Determine the LAI with all values needed
                % count amount of pixels in pointcloud
                app.computed_data.amount_pointcloud_points = numel(app.computed_data.rotated_pointcloud_img.Location);

                app.logger.WriteLog(strcat( ...
                    "Determing LAI with the following parameters:", ...
                    "\r\n \t amount of pixels in the pointcloud: ", num2str(app.computed_data.amount_pointcloud_points), ...
                    "\r\n \t total amount of pixels of pointcloud: ", num2str(app.parameter_data.area_of_image), ...
                    "\r\n \t green leave percentage: ", num2str(app.computed_data.green_covered_percent), ...
                    "\r\n \t hidden leave factor: ", num2str(app.computed_data.hidden_leave_factor)));

                app.computed_data.lai = CalcLai( ...
                    app.computed_data.amount_pointcloud_points, ...  %app.computed_data.sliced_pointclouds, ...
                    app.parameter_data.area_of_image, ...
                    app.computed_data.green_covered_percent, ...
                    app.computed_data.hidden_leave_factor);

                app.logger.WriteLog(strcat("Find LAI with value: ", num2str(app.computed_data.lai, 5)));
                app.CALCULATEDLEAFAREALabel.Text = num2str(app.computed_data.lai, 5);

                % populate the table
                app.logger.WriteLog("populate table data");
                data = {
                    'lai', app.computed_data.lai;
                    'green_covered_percent', app.computed_data.green_covered_percent;
                    'hidden_leave_factor', app.computed_data.hidden_leave_factor;
                    'z_distance', app.computed_data.z_distance;
                    'amount_pointcloud_points', app.computed_data.amount_pointcloud_points;
                    'green_threshold_a_star_mask', app.parameter_data.green_threshold_a_star_mask;
                    'area_of_image', app.parameter_data.area_of_image;
                    'total_height_pointcloud', app.parameter_data.total_height_pointcloud;
                    'layer_thickness_pointcloud', app.parameter_data.layer_thickness_pointcloud;
                    'amount_pointcloud_layers', app.computed_data.amount_pointcloud_layers;
                    'sub_layer_thickness_pointcloud', app.parameter_data.sub_layer_thickness_pointcloud;
                    'param_1_hlf', app.parameter_data.param_1_hlf;
                    'used_rotation_norm', [app.x_rotationSpinner.Value, app.y_rotationSpinner.Value, app.z_rotationSpinner.Value];
                    'parameter_file', app.parameter_data.parameter_file;
                    'bag_file', app.parameter_data.bag_file;
                    'pointcloud_file', app.parameter_data.pointcloud_file;
                    'date_of_capture', datetime("now")};

                names = {'Parameter', 'Value'};
                app.computed_data.table_data = cell2table(data, 'VariableNames', names);

                app.ParameterOverviewTable.Data = app.computed_data.table_data;

            end
        end

        % Button pushed function: ExportDataButton
        function ExportDataButtonPushed(app, event)
            app.logger.WriteLog("Try to save table data");
            tableData = app.ParameterOverviewTable.Data;

            [fullFilePath, canceled] = ExportFile('*.csv', 'Save Table Data As', char(strcat("data_", char(datetime("now")))));
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            writetable(tableData, fullFilePath);
            app.logger.WriteLog(strcat("Table data exported to: ", fullFilePath));

        end

        % Button pushed function: SearchConvertBagFileButton
        function SearchConvertBagFileButtonPushed(app, event)
            try
                app.logger.WriteLog("Search For a file of .bag type");
                [file_path, canceled] = ImportFile('*.bag');

                if canceled
                    %disp('User selected Cancel');
                    app.logger.WriteLog("Cancel search (.bag)");
                    return;
                end
                %disp(['User selected ', fullfile(path,file)]);
                app.converted_data.filepath_bag = file_path; %Transfer filepath
                app.ConvertBagFilePathField.Value = file_path; % set filepath in editable field

                app.logger.WriteLog(strcat("selected path (.bag)", file_path));

                app.logger.WriteLog("Extract the rgb and depth data");
                % extract data and show it
                [app.converted_data.original_rgb_img, app.converted_data.original_depth_img, ~] = BagParser(app.ConvertBagFilePathField.Value);

                app.logger.WriteLog("Convert depth image in rgb values");
                app.converted_data.color_depth_img = DepthToRGB(app.converted_data.original_depth_img);

                app.logger.WriteLog("Display the coloured depth image");
                DispImg(app, app.converted_data.color_depth_img, app.RGBDepthImage);
                % Add color map to plot
                colorbar(app.RGBDepthImage);

            catch error_message
                %disp("something wrong with the file");
                app.logger.WriteLogError( ...
                    "something wrong with the selected path file (.bag)", ...
                    error_message.message);
            end

        end

        % Button pushed function: SaveAspointcloudButton
        function SaveAspointcloudButtonPushed(app, event)
            app.logger.WriteLog("Save as pointcloud");

            app.converted_data.converted_pointcloud_img = ConvertBagToPointcloud(app.converted_data.original_rgb_img, app.converted_data.original_depth_img, app.converted_data.intrinsic_parameters);

            DispPCImg(app, app.converted_data.converted_pointcloud_img, app.ConvertedPointcloudImage);

            % save the file
            [fullFilePath, canceled] = ExportFile('*.ply', 'Save Pointcloud Data As', 'pointcloud');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            pcwrite(app.converted_data.converted_pointcloud_img, fullFilePath);
            app.logger.WriteLog(strcat("pointcloud data exported to: ", fullFilePath));
            app.ConvertedPlyLocation.Value = fullFilePath;

        end

        % Button pushed function: UseConvertedPointcloudButton
        function UseConvertedPointcloudButtonPushed(app, event)
            app.logger.WriteLog("Set the bag file and corresponding converted pointcloud as import files");

            app.bagFile.Value = app.ConvertBagFilePathField.Value;
            app.plyFile.Value = app.ConvertedPlyLocation.Value;

        end

        % Button pushed function: ColourDepthButton
        function ColourDepthButtonPushed(app, event)
            app.logger.WriteLog("Export Color Depth as jpg");

            [fullFilePath, canceled] = ExportFile('*.jpg', 'Save Color Depth Image As', 'coloured_depth_image');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            %export_figure = figure;
            %new_axes = copyobj(app.RGBDepthImage, export_figure);

            %saveas(export_figure, fullFilePath);
            %close(export_figure);
            imwrite(app.converted_data.color_depth_img, fullFilePath, 'jpg');

        end

        % Button pushed function: RGBButton
        function RGBButtonPushed(app, event)
            app.logger.WriteLog("Export RGB Image as jpg");

            [fullFilePath, canceled] = ExportFile('*.jpg', 'Save RGB Image As', 'RGB_image');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            imwrite(app.converted_data.original_rgb_img, fullFilePath, 'jpg');

        end

        % Button pushed function: amaskButton
        function amaskButtonPushed(app, event)
            app.logger.WriteLog("Export A* mask Image as jpg");

            [fullFilePath, canceled] = ExportFile('*.jpg', 'Save a* mask Image As', 'a_star_image');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            imwrite(app.computed_data.a_star_mask, fullFilePath, 'jpg');

        end

        % Button pushed function: OriginalRGBButton
        function OriginalRGBButtonPushed(app, event)
            app.logger.WriteLog("Export original RGB Image as jpg");

            [fullFilePath, canceled] = ExportFile('*.jpg', 'Save RGB Image As', 'RGB_image');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            imwrite(app.computed_data.original_rgb_img, fullFilePath, 'jpg');

        end

        % Button pushed function: RGBwidthamaskButton
        function RGBwidthamaskButtonPushed(app, event)
            app.logger.WriteLog("Export filtered RGB Image as jpg");

            [fullFilePath, canceled] = ExportFile('*.jpg', 'Save filtered RGB Image As', 'Filter_RGB_image');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            imwrite(app.computed_data.threshed_rgb_img, fullFilePath, 'jpg');

        end

        % Button pushed function: SearchFileButton_4
        function SearchFileButton_4Pushed(app, event)
            try
                app.logger.WriteLog("Search For a file of .bag type to examine in acceleration tab");

                [file_path, canceled] = ImportFile('*.bag');

                if canceled
                    %disp('User selected Cancel');
                    app.logger.WriteLog("Cancel search (.bag)");
                    return;
                end

                app.parameter_data.bag_file = file_path; %Transfer filepath
                app.bagFile_2.Value = file_path; % set filepath in editable field

                app.logger.WriteLog(strcat("selected path (.bag)", file_path));

            catch error_message
                %disp("something wrong with the file");
                app.logger.WriteLogError( ...
                        "something wrong with the selected path file (.bag)", ...
                        error_message.message);
            end
        end

        % Button pushed function: LoadDataButton_2
        function LoadDataButton_2Pushed(app, event)
            % load data and retrieve accel data
            app.logger.WriteLog("load data and retrieve accel data");
            try
                [~,~, accelData] = BagParser(app.bagFile_2.Value);
                [x_accel, y_accel, z_accel] = CalcAccel(accelData);

                app.logger.WriteLog(strcat("found values for accel data [max, mean]  ", ...
                    'x_accel: ',mat2str(x_accel), ...
                    '  y_accel: ',mat2str(y_accel), ...
                    '  z_accel: ',mat2str(z_accel)));

                app.XMaximalAccelEditField.Value = x_accel(1);
                app.XMeanAccelEditField.Value = x_accel(2);
                app.YMaximalAccelEditField.Value = y_accel(1);
                app.YMeanAccelEditField.Value = y_accel(2);
                app.ZMaximalAccelEditField.Value = z_accel(1);
                app.ZMeanAccelEditField.Value = z_accel(2);

            catch error_message
                %disp("something wrong with the filepath");
                app.logger.WriteLogError( ...
                    "something went wrong in LoadDataButton from accel", ...
                    error_message.message);
            end
        end

        % Button pushed function: UseCurrentButton
        function UseCurrentButtonPushed(app, event)

            % load data from workspace and retrieve accel data
            app.logger.WriteLog("load data from workspace and retrieve accel data");
            try
                %[~,~, accelData] = BagParser(app.bagFile_2.Value);
                [x_accel, y_accel, z_accel] = CalcAccel(app.computed_data.accel_measures);

                app.logger.WriteLog(strcat("found values for accel data [max, mean] ", ...
                    'x_accel',mat2str(x_accel), ...
                    'y_accel',mat2str(y_accel), ...
                    'z_accel',mat2str(z_accel)));

                app.XMaximalAccelEditField.Value = x_accel(1);
                app.XMeanAccelEditField.Value = x_accel(2);
                app.YMaximalAccelEditField.Value = y_accel(1);
                app.YMeanAccelEditField.Value = y_accel(2);
                app.ZMaximalAccelEditField.Value = z_accel(1);
                app.ZMeanAccelEditField.Value = z_accel(2);

            catch error_message
                %disp("something wrong with the filepath");
                app.logger.WriteLogError( ...
                    "something wrong with UseCurrent import button", ...
                    error_message.message);
            end
        end

        % Button pushed function: ReviewDepthButton
        function ReviewDepthButtonPushed(app, event)
            % Determine the depth view with the corrected & rotated
            % pointcloud
            app.logger.WriteLog("Determine the depth view with the corrected & rotated pointcloud");
            try
                % Roep de functie aan om de point cloud als grayscale afbeelding te visualiseren
                [app.matrix_lai_data.original_depths, app.matrix_lai_data.normalized_depth] = CreateDepthImageFromPointcloud(app.computed_data.rotated_pointcloud_img);
                
                DispImg(app, app.matrix_lai_data.normalized_depth, app.DivisionLAIDepthImage);
                colorbar(app.DivisionLAIDepthImage);
            catch error_message
                %disp("something wrong with the filepath");
                app.logger.WriteLogError( ...
                    "something wrong with review depth button", ...
                    error_message.message);
            end


                % app.matrix_lai_data = struct( ...
                % 'LAI', [], ...
                % 'used_columns', [], ...
                % 'used_rows', [], ...
                % 'green_factors',[], ...
                % 'height_factors', [],
                % 'original_depths', [],
                % 'a_star_mask', [],
                % 'sliced_rgb',[],
                % 'sliced_depth,[]'...
                % );
        end

        % Button pushed function: RotateDepthButton
        function RotateDepthButtonPushed(app, event)
            try
                app.logger.WriteLog("Rotate the depth image by 90°");
                app.matrix_lai_data.original_depths = rot90(app.matrix_lai_data.original_depths);
                app.matrix_lai_data.normalized_depth = rot90(app.matrix_lai_data.normalized_depth);
                DispImg(app, app.matrix_lai_data.normalized_depth, app.DivisionLAIDepthImage);
                colorbar(app.DivisionLAIDepthImage);
            catch error_message
                    app.logger.WriteLogError( ...
                    "something wrong with review depth button", ...
                    error_message.message);
            end

        end

        % Button pushed function: SliceDepthRGBButton
        function SliceDepthRGBButtonPushed(app, event)
            try
                % get values
                app.logger.WriteLog("get matrix dimensions");
                app.matrix_lai_data.used_columns = app.ncolumnsSpinner.Value;
                app.matrix_lai_data.used_rows = app.mrowsSpinner.Value;
                app.matrix_lai_data.a_star_mask = app.computed_data.a_star_mask;
                
                app.divisionsEditField.Value = app.matrix_lai_data.used_columns * app.matrix_lai_data.used_rows;

                % slice depth
                app.logger.WriteLog("Slice depth image & rgb image");
                app.matrix_lai_data.sliced_depth = DivideImage(app.matrix_lai_data.original_depths, app.matrix_lai_data.used_rows, app.matrix_lai_data.used_columns);
                app.matrix_lai_data.sliced_rgb = DivideImage(app.matrix_lai_data.a_star_mask, app.matrix_lai_data.used_rows, app.matrix_lai_data.used_columns);
                
                % init values
                app.logger.WriteLog("intialize used factors in LAI");
                app.matrix_lai_data.green_factors = cell(app.matrix_lai_data.used_rows, app.matrix_lai_data.used_columns,1);
                app.matrix_lai_data.height_factors = cell(app.matrix_lai_data.used_rows, app.matrix_lai_data.used_columns,1);
                app.matrix_lai_data.LAI = cell(app.matrix_lai_data.used_rows, app.matrix_lai_data.used_columns,1);

                DispImg(app, app.matrix_lai_data.normalized_depth, app.DivisionLAIDepthImage);
                colorbar(app.DivisionLAIDepthImage);

            catch error_message
                    app.logger.WriteLogError( ...
                    "something wrong with review depth button", ...
                    error_message.message);
            end
        end

        % Button pushed function: CalculateLeafAreaIndexondivisionsButton
        function CalculateLeafAreaIndexondivisionsButtonPushed(app, event)
            try
                % determine green area of each image
                app.logger.WriteLog("Determine LAI matrix");
                size_tab = app.matrix_lai_data.used_rows*app.matrix_lai_data.used_columns;

                points = cell(size_tab, 1);
                size_im = 0;
                for i=1:size_tab
                    app.matrix_lai_data.green_factors{i,1} = CalcGreenArea(app, app.matrix_lai_data.sliced_rgb{i});
                    z_height = max(max(app.matrix_lai_data.sliced_depth{i}))- min(min(app.matrix_lai_data.sliced_depth{i}));
                    app.matrix_lai_data.height_factors{i,1} = z_height;
                    
                    size_im = size(app.matrix_lai_data.sliced_rgb{i}, 1)*size(app.matrix_lai_data.sliced_rgb{i}, 2);
                    points{i,1} = numel(app.matrix_lai_data.sliced_depth{i});
    
                    %determine LAI
                    % Geen hidden leave factor bepaald dus werkt niet goed.
                    app.logger.WriteLog("No hidden layer factor so calculations will be wrong");
                    [app.matrix_lai_data.LAI{i}] = CalcLai( ...
                        points{i,1}, ...
                        size_im, ...
                        app.matrix_lai_data.green_factors{i,1}, ...
                        1);
                end

                % Display recieved data
                app.logger.WriteLog("populate table data");
                data = cell(size_tab*5+1, 1);
                for i=1:size_tab
                    data{i,1} = char(strcat(num2str(i), "_lai"));
                    data{i,2} =  app.matrix_lai_data.LAI{i};
                    data{i+1*size_tab,1} = char(strcat(num2str(i), "_green_covered_percent"));
                    data{i+1*size_tab,2} =  app.matrix_lai_data.green_factors{i};
                    data{i+2*size_tab,1} = char(strcat(num2str(i), "_z_distance"));
                    data{i+2*size_tab,2} = app.matrix_lai_data.height_factors{i};
                    data{i+3*size_tab,1} = char(strcat(num2str(i), "_amount_pointcloud_points"));
                    data{i+3*size_tab,2} =  points{i};
                    data{i+4*size_tab,1} = char(strcat(num2str(i), "_area_of_image"));
                    data{i+4*size_tab,2} = size_im;
                    
                end
                data{app.matrix_lai_data.used_rows*app.matrix_lai_data.used_columns*5+1,1} = 'time_taken';
                data{app.matrix_lai_data.used_rows*app.matrix_lai_data.used_columns*5+1,2} = datetime("now");

                names = {'Parameter', 'Value'};
                app.matrix_lai_data.table_data = cell2table(data, 'VariableNames', names);

                app.ParameterOverviewTable_2.Data = app.matrix_lai_data.table_data;

            catch error_message
                    app.logger.WriteLogError( ...
                    "something wrong with calculating matrix LAI", ...
                    error_message.message);
            end
        end

        % Button pushed function: ExportDataButton_2
        function ExportDataButton_2Pushed(app, event)
            app.logger.WriteLog("Try to save table data");
            tableData = app.ParameterOverviewTable_2.Data;

            [fullFilePath, canceled] = ExportFile('*.csv', 'Save Table Data As', char(strcat("matrix_data_", char(datetime("now")))));
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            writetable(tableData, fullFilePath);
            app.logger.WriteLog(strcat("Table data exported to: ", fullFilePath));

        end

        % Button pushed function: ExportDepthImageButton
        function ExportDepthImageButtonPushed(app, event)
            app.logger.WriteLog("Export normalized Depth as jpg");

            [fullFilePath, canceled] = ExportFile('*.jpg', 'Save normalized Depth Image As', 'normalized_depth_image');
            if canceled
                app.logger.WriteLog("Export canceled by user.");
                return;
            end

            %export_figure = figure;
            %new_axes = copyobj(app.RGBDepthImage, export_figure);

            %saveas(export_figure, fullFilePath);
            %close(export_figure);
            imwrite(app.matrix_lai_data.normalized_depth, fullFilePath, 'jpg');

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create LAIDetectionUIFigure and hide until all components are created
            app.LAIDetectionUIFigure = uifigure('Visible', 'off');
            app.LAIDetectionUIFigure.Position = [100 100 965 679];
            app.LAIDetectionUIFigure.Name = 'LAI Detection';
            app.LAIDetectionUIFigure.CloseRequestFcn = createCallbackFcn(app, @LAIDetectionUIFigureCloseRequest, true);

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.LAIDetectionUIFigure);
            app.GridLayout4.RowHeight = {'30x', '1x'};

            % Create Hyperlink
            app.Hyperlink = uihyperlink(app.GridLayout4);
            app.Hyperlink.FontSize = 10;
            app.Hyperlink.Layout.Row = 2;
            app.Hyperlink.Layout.Column = 1;
            app.Hyperlink.URL = 'https://github.com/RobbeElsermans/LAI_detection';
            app.Hyperlink.Text = 'GitHub';

            % Create madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel = uilabel(app.GridLayout4);
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel.HorizontalAlignment = 'right';
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel.WordWrap = 'on';
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel.FontSize = 10;
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel.Layout.Row = 2;
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel.Layout.Column = 2;
            app.madebyRobbeElsermansThomasKrampandAhmadShakleyaLabel.Text = 'made by: Robbe Elsermans, Thomas Kramp and Ahmad Shakleya';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout4);
            app.TabGroup.Layout.Row = 1;
            app.TabGroup.Layout.Column = [1 2];

            % Create ImportTab
            app.ImportTab = uitab(app.TabGroup);
            app.ImportTab.Tooltip = {'Import data to work with.'};
            app.ImportTab.Title = 'Import';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.ImportTab);
            app.GridLayout.RowHeight = {'25x', '25x', '50x'};
            app.GridLayout.RowSpacing = 4.4;
            app.GridLayout.Padding = [10 4.4 10 4.4];

            % Create DepthImg
            app.DepthImg = uiaxes(app.GridLayout);
            title(app.DepthImg, 'Pointcloud')
            app.DepthImg.XTick = [];
            app.DepthImg.YTick = [];
            app.DepthImg.Layout.Row = 3;
            app.DepthImg.Layout.Column = 2;

            % Create RGBImg
            app.RGBImg = uiaxes(app.GridLayout);
            title(app.RGBImg, 'RGB')
            app.RGBImg.XTick = [];
            app.RGBImg.YTick = [];
            app.RGBImg.Layout.Row = 3;
            app.RGBImg.Layout.Column = 1;

            % Create ImportfilesPanel
            app.ImportfilesPanel = uipanel(app.GridLayout);
            app.ImportfilesPanel.Title = 'Import files';
            app.ImportfilesPanel.Layout.Row = [1 2];
            app.ImportfilesPanel.Layout.Column = [1 2];

            % Create GridLayout9
            app.GridLayout9 = uigridlayout(app.ImportfilesPanel);
            app.GridLayout9.ColumnWidth = {'0.5x', '2x', '0.5x'};
            app.GridLayout9.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x'};

            % Create content2
            app.content2 = uilabel(app.GridLayout9);
            app.content2.Layout.Row = 1;
            app.content2.Layout.Column = 1;
            app.content2.Text = 'Path .bag file';

            % Create bagFile
            app.bagFile = uieditfield(app.GridLayout9, 'text');
            app.bagFile.Placeholder = 'C:\\img1.bag';
            app.bagFile.Layout.Row = 1;
            app.bagFile.Layout.Column = 2;

            % Create content2_2
            app.content2_2 = uilabel(app.GridLayout9);
            app.content2_2.Layout.Row = 2;
            app.content2_2.Layout.Column = 1;
            app.content2_2.Text = 'Path . ply file';

            % Create plyFile
            app.plyFile = uieditfield(app.GridLayout9, 'text');
            app.plyFile.Placeholder = 'C:\\img1.ply';
            app.plyFile.Layout.Row = 2;
            app.plyFile.Layout.Column = 2;

            % Create SearchFileButton
            app.SearchFileButton = uibutton(app.GridLayout9, 'push');
            app.SearchFileButton.ButtonPushedFcn = createCallbackFcn(app, @SearchFileButtonPushed, true);
            app.SearchFileButton.Layout.Row = 1;
            app.SearchFileButton.Layout.Column = 3;
            app.SearchFileButton.Text = 'Search File';

            % Create SearchFileButton_2
            app.SearchFileButton_2 = uibutton(app.GridLayout9, 'push');
            app.SearchFileButton_2.ButtonPushedFcn = createCallbackFcn(app, @SearchFileButton_2Pushed, true);
            app.SearchFileButton_2.Layout.Row = 2;
            app.SearchFileButton_2.Layout.Column = 3;
            app.SearchFileButton_2.Text = 'Search File';

            % Create AreaofimagepixelsEditFieldLabel
            app.AreaofimagepixelsEditFieldLabel = uilabel(app.GridLayout9);
            app.AreaofimagepixelsEditFieldLabel.Enable = 'off';
            app.AreaofimagepixelsEditFieldLabel.Visible = 'off';
            app.AreaofimagepixelsEditFieldLabel.Layout.Row = 4;
            app.AreaofimagepixelsEditFieldLabel.Layout.Column = 1;
            app.AreaofimagepixelsEditFieldLabel.Text = 'Area of image (pixels)';

            % Create AreaofimagepixelsEditField
            app.AreaofimagepixelsEditField = uieditfield(app.GridLayout9, 'numeric');
            app.AreaofimagepixelsEditField.Limits = [0 Inf];
            app.AreaofimagepixelsEditField.ValueDisplayFormat = '%0.0f';
            app.AreaofimagepixelsEditField.HorizontalAlignment = 'left';
            app.AreaofimagepixelsEditField.Enable = 'off';
            app.AreaofimagepixelsEditField.Visible = 'off';
            app.AreaofimagepixelsEditField.Layout.Row = 4;
            app.AreaofimagepixelsEditField.Layout.Column = [2 3];

            % Create LoadDataButton
            app.LoadDataButton = uibutton(app.GridLayout9, 'push');
            app.LoadDataButton.ButtonPushedFcn = createCallbackFcn(app, @LoadFile, true);
            app.LoadDataButton.Layout.Row = 7;
            app.LoadDataButton.Layout.Column = [1 3];
            app.LoadDataButton.Text = 'Load Data';

            % Create ErrorLabel
            app.ErrorLabel = uilabel(app.GridLayout9);
            app.ErrorLabel.Tag = 'FileImportError';
            app.ErrorLabel.FontColor = [1 0 0];
            app.ErrorLabel.Visible = 'off';
            app.ErrorLabel.Layout.Row = 6;
            app.ErrorLabel.Layout.Column = [1 3];
            app.ErrorLabel.Text = 'Error';

            % Create ParametersLabel
            app.ParametersLabel = uilabel(app.GridLayout9);
            app.ParametersLabel.Layout.Row = 5;
            app.ParametersLabel.Layout.Column = 1;
            app.ParametersLabel.Text = 'Parameter file';

            % Create paramFile
            app.paramFile = uieditfield(app.GridLayout9, 'text');
            app.paramFile.Placeholder = 'defaultParameters.json';
            app.paramFile.Layout.Row = 5;
            app.paramFile.Layout.Column = 2;

            % Create SearchFileButton_3
            app.SearchFileButton_3 = uibutton(app.GridLayout9, 'push');
            app.SearchFileButton_3.ButtonPushedFcn = createCallbackFcn(app, @SearchFileButton_3Pushed, true);
            app.SearchFileButton_3.Layout.Row = 5;
            app.SearchFileButton_3.Layout.Column = 3;
            app.SearchFileButton_3.Text = 'Search File';

            % Create CreatepointcloudfrombagfileCheckBox
            app.CreatepointcloudfrombagfileCheckBox = uicheckbox(app.GridLayout9);
            app.CreatepointcloudfrombagfileCheckBox.Enable = 'off';
            app.CreatepointcloudfrombagfileCheckBox.Visible = 'off';
            app.CreatepointcloudfrombagfileCheckBox.Text = 'Create pointcloud from .bag file';
            app.CreatepointcloudfrombagfileCheckBox.Layout.Row = 3;
            app.CreatepointcloudfrombagfileCheckBox.Layout.Column = 2;

            % Create ExamineTab
            app.ExamineTab = uitab(app.TabGroup);
            app.ExamineTab.Tooltip = {''};
            app.ExamineTab.Title = 'Examine';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.ExamineTab);
            app.TabGroup3.Position = [0 2 944 602];

            % Create PointcloudTab
            app.PointcloudTab = uitab(app.TabGroup3);
            app.PointcloudTab.Tooltip = {''};
            app.PointcloudTab.Title = 'Pointcloud';

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.PointcloudTab);
            app.GridLayout5.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout5.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '4x', '4x'};

            % Create DepthImgCorrected
            app.DepthImgCorrected = uiaxes(app.GridLayout5);
            title(app.DepthImgCorrected, 'Point Cloud corrected')
            xlabel(app.DepthImgCorrected, 'X')
            ylabel(app.DepthImgCorrected, 'Y')
            zlabel(app.DepthImgCorrected, 'Z')
            app.DepthImgCorrected.Layout.Row = [6 8];
            app.DepthImgCorrected.Layout.Column = [1 4];

            % Create PointCloudLayersView
            app.PointCloudLayersView = uiaxes(app.GridLayout5);
            title(app.PointCloudLayersView, 'Point Cloud Layer')
            xlabel(app.PointCloudLayersView, 'X')
            ylabel(app.PointCloudLayersView, 'Y')
            zlabel(app.PointCloudLayersView, 'Z')
            app.PointCloudLayersView.Layout.Row = [6 8];
            app.PointCloudLayersView.Layout.Column = [5 8];

            % Create ManualplanerotationPanel
            app.ManualplanerotationPanel = uipanel(app.GridLayout5);
            app.ManualplanerotationPanel.Title = 'Manual plane rotation';
            app.ManualplanerotationPanel.Layout.Row = [1 5];
            app.ManualplanerotationPanel.Layout.Column = [5 6];

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.ManualplanerotationPanel);
            app.GridLayout7.ColumnWidth = {'1.5x', '1x'};
            app.GridLayout7.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create z_rotationSpinner_2Label
            app.z_rotationSpinner_2Label = uilabel(app.GridLayout7);
            app.z_rotationSpinner_2Label.HorizontalAlignment = 'right';
            app.z_rotationSpinner_2Label.Layout.Row = 3;
            app.z_rotationSpinner_2Label.Layout.Column = 1;
            app.z_rotationSpinner_2Label.Text = 'z_rotation';

            % Create z_rotationSpinner
            app.z_rotationSpinner = uispinner(app.GridLayout7);
            app.z_rotationSpinner.Step = 0.01;
            app.z_rotationSpinner.Limits = [-1 1];
            app.z_rotationSpinner.ValueDisplayFormat = '%.4f';
            app.z_rotationSpinner.Layout.Row = 3;
            app.z_rotationSpinner.Layout.Column = 2;

            % Create y_rotationSpinnerLabel
            app.y_rotationSpinnerLabel = uilabel(app.GridLayout7);
            app.y_rotationSpinnerLabel.HorizontalAlignment = 'right';
            app.y_rotationSpinnerLabel.Layout.Row = 2;
            app.y_rotationSpinnerLabel.Layout.Column = 1;
            app.y_rotationSpinnerLabel.Text = 'y_rotation';

            % Create y_rotationSpinner
            app.y_rotationSpinner = uispinner(app.GridLayout7);
            app.y_rotationSpinner.Step = 0.01;
            app.y_rotationSpinner.Limits = [-1 1];
            app.y_rotationSpinner.ValueDisplayFormat = '%.4f';
            app.y_rotationSpinner.Layout.Row = 2;
            app.y_rotationSpinner.Layout.Column = 2;

            % Create x_rotationSpinnerLabel
            app.x_rotationSpinnerLabel = uilabel(app.GridLayout7);
            app.x_rotationSpinnerLabel.HorizontalAlignment = 'right';
            app.x_rotationSpinnerLabel.Layout.Row = 1;
            app.x_rotationSpinnerLabel.Layout.Column = 1;
            app.x_rotationSpinnerLabel.Text = 'x_rotation';

            % Create x_rotationSpinner
            app.x_rotationSpinner = uispinner(app.GridLayout7);
            app.x_rotationSpinner.Step = 0.01;
            app.x_rotationSpinner.Limits = [-1 1];
            app.x_rotationSpinner.ValueDisplayFormat = '%.4f';
            app.x_rotationSpinner.Layout.Row = 1;
            app.x_rotationSpinner.Layout.Column = 2;

            % Create ResetManualRotationButton
            app.ResetManualRotationButton = uibutton(app.GridLayout7, 'push');
            app.ResetManualRotationButton.ButtonPushedFcn = createCallbackFcn(app, @AutoRotateButtonPushed, true);
            app.ResetManualRotationButton.Layout.Row = 5;
            app.ResetManualRotationButton.Layout.Column = [1 2];
            app.ResetManualRotationButton.Text = 'Reset';

            % Create ApplyManualRotateButton
            app.ApplyManualRotateButton = uibutton(app.GridLayout7, 'push');
            app.ApplyManualRotateButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyManualRotateButtonPushed, true);
            app.ApplyManualRotateButton.Layout.Row = 4;
            app.ApplyManualRotateButton.Layout.Column = [1 2];
            app.ApplyManualRotateButton.Text = 'Apply';

            % Create AutoplanerotationPanel
            app.AutoplanerotationPanel = uipanel(app.GridLayout5);
            app.AutoplanerotationPanel.Title = 'Auto plane rotation';
            app.AutoplanerotationPanel.Layout.Row = [1 5];
            app.AutoplanerotationPanel.Layout.Column = [3 4];

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.AutoplanerotationPanel);
            app.GridLayout8.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout8.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create AutoRotateButton
            app.AutoRotateButton = uibutton(app.GridLayout8, 'push');
            app.AutoRotateButton.ButtonPushedFcn = createCallbackFcn(app, @AutoRotateButtonPushed, true);
            app.AutoRotateButton.Layout.Row = 4;
            app.AutoRotateButton.Layout.Column = [1 3];
            app.AutoRotateButton.Text = 'Auto Rotate';

            % Create XSwitchLabel
            app.XSwitchLabel = uilabel(app.GridLayout8);
            app.XSwitchLabel.HorizontalAlignment = 'center';
            app.XSwitchLabel.Layout.Row = 3;
            app.XSwitchLabel.Layout.Column = 1;
            app.XSwitchLabel.Text = 'X';

            % Create XNormSwitch
            app.XNormSwitch = uiswitch(app.GridLayout8, 'slider');
            app.XNormSwitch.Items = {'0', '1'};
            app.XNormSwitch.ItemsData = [0 1];
            app.XNormSwitch.Orientation = 'vertical';
            app.XNormSwitch.Layout.Row = [1 2];
            app.XNormSwitch.Layout.Column = 1;
            app.XNormSwitch.Value = 0;

            % Create YSwitchLabel
            app.YSwitchLabel = uilabel(app.GridLayout8);
            app.YSwitchLabel.HorizontalAlignment = 'center';
            app.YSwitchLabel.Layout.Row = 3;
            app.YSwitchLabel.Layout.Column = 2;
            app.YSwitchLabel.Text = 'Y';

            % Create YNormSwitch
            app.YNormSwitch = uiswitch(app.GridLayout8, 'slider');
            app.YNormSwitch.Items = {'0', '1'};
            app.YNormSwitch.ItemsData = [0 1];
            app.YNormSwitch.Orientation = 'vertical';
            app.YNormSwitch.Layout.Row = [1 2];
            app.YNormSwitch.Layout.Column = 2;
            app.YNormSwitch.Value = 0;

            % Create ZSwitchLabel
            app.ZSwitchLabel = uilabel(app.GridLayout8);
            app.ZSwitchLabel.HorizontalAlignment = 'center';
            app.ZSwitchLabel.Layout.Row = 3;
            app.ZSwitchLabel.Layout.Column = 3;
            app.ZSwitchLabel.Text = 'Z';

            % Create ZNormSwitch
            app.ZNormSwitch = uiswitch(app.GridLayout8, 'slider');
            app.ZNormSwitch.Items = {'0', '1'};
            app.ZNormSwitch.ItemsData = [0 1];
            app.ZNormSwitch.Orientation = 'vertical';
            app.ZNormSwitch.Layout.Row = [1 2];
            app.ZNormSwitch.Layout.Column = 3;
            app.ZNormSwitch.Value = 0;

            % Create ResetAutoRotationButton
            app.ResetAutoRotationButton = uibutton(app.GridLayout8, 'push');
            app.ResetAutoRotationButton.ButtonPushedFcn = createCallbackFcn(app, @ResetAutoRotationButtonPushed, true);
            app.ResetAutoRotationButton.Layout.Row = 5;
            app.ResetAutoRotationButton.Layout.Column = [1 3];
            app.ResetAutoRotationButton.Text = 'Reset';

            % Create ImageFilterPanel
            app.ImageFilterPanel = uipanel(app.GridLayout5);
            app.ImageFilterPanel.Title = 'Image Filter';
            app.ImageFilterPanel.Layout.Row = [1 5];
            app.ImageFilterPanel.Layout.Column = [1 2];

            % Create GridLayout10
            app.GridLayout10 = uigridlayout(app.ImageFilterPanel);
            app.GridLayout10.ColumnWidth = {'1.5x', '1x'};
            app.GridLayout10.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create TotalHeightmSpinnerLabel
            app.TotalHeightmSpinnerLabel = uilabel(app.GridLayout10);
            app.TotalHeightmSpinnerLabel.WordWrap = 'on';
            app.TotalHeightmSpinnerLabel.Layout.Row = 1;
            app.TotalHeightmSpinnerLabel.Layout.Column = 1;
            app.TotalHeightmSpinnerLabel.Text = 'Total Height (m)';

            % Create TotalHeightSpinner
            app.TotalHeightSpinner = uispinner(app.GridLayout10);
            app.TotalHeightSpinner.Step = 0.01;
            app.TotalHeightSpinner.Limits = [0 Inf];
            app.TotalHeightSpinner.Layout.Row = 1;
            app.TotalHeightSpinner.Layout.Column = 2;

            % Create ApplyLayerDefButton
            app.ApplyLayerDefButton = uibutton(app.GridLayout10, 'push');
            app.ApplyLayerDefButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyLayerDefButtonPushed, true);
            app.ApplyLayerDefButton.Layout.Row = 4;
            app.ApplyLayerDefButton.Layout.Column = [1 2];
            app.ApplyLayerDefButton.Text = 'Apply';

            % Create LayerdividerPanel
            app.LayerdividerPanel = uipanel(app.GridLayout5);
            app.LayerdividerPanel.Title = 'Layer divider';
            app.LayerdividerPanel.Layout.Row = [1 5];
            app.LayerdividerPanel.Layout.Column = [7 8];

            % Create GridLayout7_2
            app.GridLayout7_2 = uigridlayout(app.LayerdividerPanel);
            app.GridLayout7_2.ColumnWidth = {'1.5x', '1x'};
            app.GridLayout7_2.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create LayerPickerLabel
            app.LayerPickerLabel = uilabel(app.GridLayout7_2);
            app.LayerPickerLabel.HorizontalAlignment = 'right';
            app.LayerPickerLabel.Layout.Row = 5;
            app.LayerPickerLabel.Layout.Column = 1;
            app.LayerPickerLabel.Text = 'Layer Picker';

            % Create LayerPickerSpinner
            app.LayerPickerSpinner = uispinner(app.GridLayout7_2);
            app.LayerPickerSpinner.Limits = [1 1];
            app.LayerPickerSpinner.ValueChangedFcn = createCallbackFcn(app, @LayerPickerSpinnerValueChanged, true);
            app.LayerPickerSpinner.Layout.Row = 5;
            app.LayerPickerSpinner.Layout.Column = 2;
            app.LayerPickerSpinner.Value = 1;

            % Create LayerThicknessmSpinnerLabel
            app.LayerThicknessmSpinnerLabel = uilabel(app.GridLayout7_2);
            app.LayerThicknessmSpinnerLabel.WordWrap = 'on';
            app.LayerThicknessmSpinnerLabel.Layout.Row = 1;
            app.LayerThicknessmSpinnerLabel.Layout.Column = 1;
            app.LayerThicknessmSpinnerLabel.Text = 'Layer Thickness (m)';

            % Create LayerThicknessSpinner
            app.LayerThicknessSpinner = uispinner(app.GridLayout7_2);
            app.LayerThicknessSpinner.Step = 0.01;
            app.LayerThicknessSpinner.Limits = [0 Inf];
            app.LayerThicknessSpinner.Layout.Row = 1;
            app.LayerThicknessSpinner.Layout.Column = 2;

            % Create LayersLabel
            app.LayersLabel = uilabel(app.GridLayout7_2);
            app.LayersLabel.Layout.Row = 2;
            app.LayersLabel.Layout.Column = 1;
            app.LayersLabel.Text = 'Layers';

            % Create AMOUNTOFSLICESLabel
            app.AMOUNTOFSLICESLabel = uilabel(app.GridLayout7_2);
            app.AMOUNTOFSLICESLabel.WordWrap = 'on';
            app.AMOUNTOFSLICESLabel.Layout.Row = 2;
            app.AMOUNTOFSLICESLabel.Layout.Column = 2;
            app.AMOUNTOFSLICESLabel.Text = 'AMOUNT OF SLICES';

            % Create LayerSlicerButton
            app.LayerSlicerButton = uibutton(app.GridLayout7_2, 'push');
            app.LayerSlicerButton.ButtonPushedFcn = createCallbackFcn(app, @LayerSlicerButtonPushed, true);
            app.LayerSlicerButton.Layout.Row = 4;
            app.LayerSlicerButton.Layout.Column = [1 2];
            app.LayerSlicerButton.Text = 'Apply';

            % Create ImageTab
            app.ImageTab = uitab(app.TabGroup3);
            app.ImageTab.Title = 'Image';

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.ImageTab);
            app.GridLayout6.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout6.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '4x', '4x'};

            % Create GreenFilteredImage
            app.GreenFilteredImage = uiaxes(app.GridLayout6);
            title(app.GreenFilteredImage, 'Original Image with a* mask')
            app.GreenFilteredImage.XTick = [];
            app.GreenFilteredImage.YTick = [];
            app.GreenFilteredImage.Layout.Row = [6 8];
            app.GreenFilteredImage.Layout.Column = [5 8];

            % Create OriginalImage
            app.OriginalImage = uiaxes(app.GridLayout6);
            title(app.OriginalImage, 'Original Image')
            app.OriginalImage.XTick = [];
            app.OriginalImage.YTick = [];
            app.OriginalImage.Layout.Row = [1 5];
            app.OriginalImage.Layout.Column = [5 8];

            % Create AStarMaskImage
            app.AStarMaskImage = uiaxes(app.GridLayout6);
            title(app.AStarMaskImage, 'a* mask')
            app.AStarMaskImage.XTick = [];
            app.AStarMaskImage.YTick = [];
            app.AStarMaskImage.Layout.Row = [6 8];
            app.AStarMaskImage.Layout.Column = [1 4];

            % Create GreentresholdPanel
            app.GreentresholdPanel = uipanel(app.GridLayout6);
            app.GreentresholdPanel.Title = 'Green treshold';
            app.GreentresholdPanel.Layout.Row = [1 5];
            app.GreentresholdPanel.Layout.Column = [1 2];

            % Create GridLayout11_2
            app.GridLayout11_2 = uigridlayout(app.GreentresholdPanel);
            app.GridLayout11_2.ColumnWidth = {'1.5x', '1x'};
            app.GridLayout11_2.RowHeight = {'1x', '1x', '1x', '1x', '1x'};

            % Create greenthreshholdaLabel
            app.greenthreshholdaLabel = uilabel(app.GridLayout11_2);
            app.greenthreshholdaLabel.HorizontalAlignment = 'right';
            app.greenthreshholdaLabel.WordWrap = 'on';
            app.greenthreshholdaLabel.Layout.Row = 1;
            app.greenthreshholdaLabel.Layout.Column = 1;
            app.greenthreshholdaLabel.Text = 'green threshhold (a*)';

            % Create AStarThresholdSpinner
            app.AStarThresholdSpinner = uispinner(app.GridLayout11_2);
            app.AStarThresholdSpinner.Step = 0.1;
            app.AStarThresholdSpinner.Limits = [-127 128];
            app.AStarThresholdSpinner.ValueDisplayFormat = '%.2f';
            app.AStarThresholdSpinner.ValueChangedFcn = createCallbackFcn(app, @AStarThresholdSpinnerValueChanged, true);
            app.AStarThresholdSpinner.Layout.Row = 1;
            app.AStarThresholdSpinner.Layout.Column = 2;

            % Create GreenleaveLabel
            app.GreenleaveLabel = uilabel(app.GridLayout11_2);
            app.GreenleaveLabel.HorizontalAlignment = 'right';
            app.GreenleaveLabel.Layout.Row = 2;
            app.GreenleaveLabel.Layout.Column = 1;
            app.GreenleaveLabel.Text = 'Green leave %';

            % Create GreenCover
            app.GreenCover = uieditfield(app.GridLayout11_2, 'numeric');
            app.GreenCover.Editable = 'off';
            app.GreenCover.Layout.Row = 2;
            app.GreenCover.Layout.Column = 2;

            % Create ExportsPanel_2
            app.ExportsPanel_2 = uipanel(app.GridLayout6);
            app.ExportsPanel_2.Title = 'Exports';
            app.ExportsPanel_2.Layout.Row = [1 4];
            app.ExportsPanel_2.Layout.Column = [3 4];

            % Create GridLayout9_4
            app.GridLayout9_4 = uigridlayout(app.ExportsPanel_2);
            app.GridLayout9_4.RowHeight = {'1x', '1x', '1x'};

            % Create RGBwidthamaskButton
            app.RGBwidthamaskButton = uibutton(app.GridLayout9_4, 'push');
            app.RGBwidthamaskButton.ButtonPushedFcn = createCallbackFcn(app, @RGBwidthamaskButtonPushed, true);
            app.RGBwidthamaskButton.Layout.Row = 3;
            app.RGBwidthamaskButton.Layout.Column = [1 2];
            app.RGBwidthamaskButton.Text = 'RGB width a* mask';

            % Create OriginalRGBButton
            app.OriginalRGBButton = uibutton(app.GridLayout9_4, 'push');
            app.OriginalRGBButton.ButtonPushedFcn = createCallbackFcn(app, @OriginalRGBButtonPushed, true);
            app.OriginalRGBButton.Layout.Row = 1;
            app.OriginalRGBButton.Layout.Column = [1 2];
            app.OriginalRGBButton.Text = 'Original RGB';

            % Create amaskButton
            app.amaskButton = uibutton(app.GridLayout9_4, 'push');
            app.amaskButton.ButtonPushedFcn = createCallbackFcn(app, @amaskButtonPushed, true);
            app.amaskButton.Layout.Row = 2;
            app.amaskButton.Layout.Column = [1 2];
            app.amaskButton.Text = 'a* mask';

            % Create LAITab
            app.LAITab = uitab(app.TabGroup3);
            app.LAITab.Tooltip = {'Compute Leave Area Index and otpion to finetune the used equasions.'};
            app.LAITab.Title = 'LAI';

            % Create GridLayout11
            app.GridLayout11 = uigridlayout(app.LAITab);
            app.GridLayout11.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout11.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '8x', '8x'};

            % Create CalculateLeafAreaIndexButton
            app.CalculateLeafAreaIndexButton = uibutton(app.GridLayout11, 'push');
            app.CalculateLeafAreaIndexButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateLeafAreaIndexButtonPushed, true);
            app.CalculateLeafAreaIndexButton.Layout.Row = 6;
            app.CalculateLeafAreaIndexButton.Layout.Column = [1 2];
            app.CalculateLeafAreaIndexButton.Text = 'Calculate Leaf  Area Index';

            % Create LeafAreaIndexLabel
            app.LeafAreaIndexLabel = uilabel(app.GridLayout11);
            app.LeafAreaIndexLabel.Layout.Row = 2;
            app.LeafAreaIndexLabel.Layout.Column = 1;
            app.LeafAreaIndexLabel.Text = 'Leaf Area Index';

            % Create CALCULATEDLEAFAREALabel
            app.CALCULATEDLEAFAREALabel = uilabel(app.GridLayout11);
            app.CALCULATEDLEAFAREALabel.WordWrap = 'on';
            app.CALCULATEDLEAFAREALabel.Layout.Row = 2;
            app.CALCULATEDLEAFAREALabel.Layout.Column = 2;
            app.CALCULATEDLEAFAREALabel.Text = 'CALCULATED LEAF AREA';

            % Create DistlayermLabel_2
            app.DistlayermLabel_2 = uilabel(app.GridLayout11);
            app.DistlayermLabel_2.WordWrap = 'on';
            app.DistlayermLabel_2.Layout.Row = 1;
            app.DistlayermLabel_2.Layout.Column = 1;
            app.DistlayermLabel_2.Text = 'Dist/ layer (m)';

            % Create SubLayerThicknessSpinner
            app.SubLayerThicknessSpinner = uispinner(app.GridLayout11);
            app.SubLayerThicknessSpinner.Step = 0.01;
            app.SubLayerThicknessSpinner.Limits = [0 Inf];
            app.SubLayerThicknessSpinner.Layout.Row = 1;
            app.SubLayerThicknessSpinner.Layout.Column = 2;

            % Create HIDDENLEAVESFACTORLabel
            app.HIDDENLEAVESFACTORLabel = uilabel(app.GridLayout11);
            app.HIDDENLEAVESFACTORLabel.WordWrap = 'on';
            app.HIDDENLEAVESFACTORLabel.Layout.Row = 3;
            app.HIDDENLEAVESFACTORLabel.Layout.Column = 2;
            app.HIDDENLEAVESFACTORLabel.Text = 'HIDDEN LEAVES FACTOR';

            % Create hiddenleavefactorLabel
            app.hiddenleavefactorLabel = uilabel(app.GridLayout11);
            app.hiddenleavefactorLabel.Layout.Row = 3;
            app.hiddenleavefactorLabel.Layout.Column = 1;
            app.hiddenleavefactorLabel.Text = 'hidden leave factor';

            % Create ParameterOverviewTable
            app.ParameterOverviewTable = uitable(app.GridLayout11);
            app.ParameterOverviewTable.ColumnName = {'Parameter'; 'Value'};
            app.ParameterOverviewTable.ColumnRearrangeable = 'on';
            app.ParameterOverviewTable.RowName = {};
            app.ParameterOverviewTable.ColumnSortable = true;
            app.ParameterOverviewTable.ColumnEditable = true;
            app.ParameterOverviewTable.Layout.Row = [1 8];
            app.ParameterOverviewTable.Layout.Column = [6 8];

            % Create ExportDataButton
            app.ExportDataButton = uibutton(app.GridLayout11, 'push');
            app.ExportDataButton.ButtonPushedFcn = createCallbackFcn(app, @ExportDataButtonPushed, true);
            app.ExportDataButton.Layout.Row = 1;
            app.ExportDataButton.Layout.Column = 5;
            app.ExportDataButton.Text = 'ExportData';

            % Create MatrixLAITab
            app.MatrixLAITab = uitab(app.TabGroup3);
            app.MatrixLAITab.Title = 'Matrix LAI';

            % Create GridLayout11_3
            app.GridLayout11_3 = uigridlayout(app.MatrixLAITab);
            app.GridLayout11_3.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout11_3.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '8x', '8x'};

            % Create DivisionLAIDepthImage
            app.DivisionLAIDepthImage = uiaxes(app.GridLayout11_3);
            title(app.DivisionLAIDepthImage, 'Depth Image')
            xlabel(app.DivisionLAIDepthImage, 'X')
            ylabel(app.DivisionLAIDepthImage, 'Y')
            zlabel(app.DivisionLAIDepthImage, 'Z')
            app.DivisionLAIDepthImage.Layout.Row = [7 8];
            app.DivisionLAIDepthImage.Layout.Column = [1 4];

            % Create CalculateLeafAreaIndexondivisionsButton
            app.CalculateLeafAreaIndexondivisionsButton = uibutton(app.GridLayout11_3, 'push');
            app.CalculateLeafAreaIndexondivisionsButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateLeafAreaIndexondivisionsButtonPushed, true);
            app.CalculateLeafAreaIndexondivisionsButton.Layout.Row = 6;
            app.CalculateLeafAreaIndexondivisionsButton.Layout.Column = [1 2];
            app.CalculateLeafAreaIndexondivisionsButton.Text = 'Calculate Leaf  Area Index on divisions';

            % Create ParameterOverviewTable_2
            app.ParameterOverviewTable_2 = uitable(app.GridLayout11_3);
            app.ParameterOverviewTable_2.ColumnName = {'Parameter'; 'Value'};
            app.ParameterOverviewTable_2.ColumnRearrangeable = 'on';
            app.ParameterOverviewTable_2.RowName = {};
            app.ParameterOverviewTable_2.ColumnSortable = true;
            app.ParameterOverviewTable_2.ColumnEditable = true;
            app.ParameterOverviewTable_2.Layout.Row = [1 8];
            app.ParameterOverviewTable_2.Layout.Column = [6 8];

            % Create ExportDataButton_2
            app.ExportDataButton_2 = uibutton(app.GridLayout11_3, 'push');
            app.ExportDataButton_2.ButtonPushedFcn = createCallbackFcn(app, @ExportDataButton_2Pushed, true);
            app.ExportDataButton_2.Layout.Row = 1;
            app.ExportDataButton_2.Layout.Column = 5;
            app.ExportDataButton_2.Text = 'ExportData';

            % Create ncolumnsSpinnerLabel
            app.ncolumnsSpinnerLabel = uilabel(app.GridLayout11_3);
            app.ncolumnsSpinnerLabel.HorizontalAlignment = 'right';
            app.ncolumnsSpinnerLabel.Layout.Row = 1;
            app.ncolumnsSpinnerLabel.Layout.Column = 1;
            app.ncolumnsSpinnerLabel.Text = 'n-columns';

            % Create ncolumnsSpinner
            app.ncolumnsSpinner = uispinner(app.GridLayout11_3);
            app.ncolumnsSpinner.Limits = [1 Inf];
            app.ncolumnsSpinner.Layout.Row = 1;
            app.ncolumnsSpinner.Layout.Column = 2;
            app.ncolumnsSpinner.Value = 1;

            % Create mrowsSpinnerLabel
            app.mrowsSpinnerLabel = uilabel(app.GridLayout11_3);
            app.mrowsSpinnerLabel.HorizontalAlignment = 'right';
            app.mrowsSpinnerLabel.Layout.Row = 2;
            app.mrowsSpinnerLabel.Layout.Column = 1;
            app.mrowsSpinnerLabel.Text = 'm-rows';

            % Create mrowsSpinner
            app.mrowsSpinner = uispinner(app.GridLayout11_3);
            app.mrowsSpinner.Limits = [1 Inf];
            app.mrowsSpinner.Layout.Row = 2;
            app.mrowsSpinner.Layout.Column = 2;
            app.mrowsSpinner.Value = 1;

            % Create Label
            app.Label = uilabel(app.GridLayout11_3);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Layout.Row = 3;
            app.Label.Layout.Column = 1;
            app.Label.Text = 'divisions';

            % Create divisionsEditField
            app.divisionsEditField = uieditfield(app.GridLayout11_3, 'numeric');
            app.divisionsEditField.Editable = 'off';
            app.divisionsEditField.Layout.Row = 3;
            app.divisionsEditField.Layout.Column = 2;

            % Create SliceDepthRGBButton
            app.SliceDepthRGBButton = uibutton(app.GridLayout11_3, 'push');
            app.SliceDepthRGBButton.ButtonPushedFcn = createCallbackFcn(app, @SliceDepthRGBButtonPushed, true);
            app.SliceDepthRGBButton.Layout.Row = 5;
            app.SliceDepthRGBButton.Layout.Column = [1 2];
            app.SliceDepthRGBButton.Text = 'Slice Depth & RGB';

            % Create RotateDepthButton
            app.RotateDepthButton = uibutton(app.GridLayout11_3, 'push');
            app.RotateDepthButton.ButtonPushedFcn = createCallbackFcn(app, @RotateDepthButtonPushed, true);
            app.RotateDepthButton.Layout.Row = 4;
            app.RotateDepthButton.Layout.Column = 2;
            app.RotateDepthButton.Text = 'Rotate Depth';

            % Create ReviewDepthButton
            app.ReviewDepthButton = uibutton(app.GridLayout11_3, 'push');
            app.ReviewDepthButton.ButtonPushedFcn = createCallbackFcn(app, @ReviewDepthButtonPushed, true);
            app.ReviewDepthButton.Layout.Row = 4;
            app.ReviewDepthButton.Layout.Column = 1;
            app.ReviewDepthButton.Text = 'Review Depth';

            % Create ExportDepthImageButton
            app.ExportDepthImageButton = uibutton(app.GridLayout11_3, 'push');
            app.ExportDepthImageButton.ButtonPushedFcn = createCallbackFcn(app, @ExportDepthImageButtonPushed, true);
            app.ExportDepthImageButton.Layout.Row = 6;
            app.ExportDepthImageButton.Layout.Column = [3 4];
            app.ExportDepthImageButton.Text = 'Export Depth Image';

            % Create AccelerationMeterTab
            app.AccelerationMeterTab = uitab(app.TabGroup3);
            app.AccelerationMeterTab.Title = 'Acceleration Meter';

            % Create AccelerationOverviewPanel
            app.AccelerationOverviewPanel = uipanel(app.AccelerationMeterTab);
            app.AccelerationOverviewPanel.Title = 'Acceleration Overview';
            app.AccelerationOverviewPanel.Position = [232 69 480 468];

            % Create GridLayout12
            app.GridLayout12 = uigridlayout(app.AccelerationOverviewPanel);
            app.GridLayout12.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout12.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x', '1x'};

            % Create maximalEditFieldLabel
            app.maximalEditFieldLabel = uilabel(app.GridLayout12);
            app.maximalEditFieldLabel.HorizontalAlignment = 'right';
            app.maximalEditFieldLabel.Layout.Row = 2;
            app.maximalEditFieldLabel.Layout.Column = 1;
            app.maximalEditFieldLabel.Text = 'maximal';

            % Create XMaximalAccelEditField
            app.XMaximalAccelEditField = uieditfield(app.GridLayout12, 'numeric');
            app.XMaximalAccelEditField.Layout.Row = 2;
            app.XMaximalAccelEditField.Layout.Column = [2 3];

            % Create meanEditFieldLabel
            app.meanEditFieldLabel = uilabel(app.GridLayout12);
            app.meanEditFieldLabel.HorizontalAlignment = 'right';
            app.meanEditFieldLabel.Layout.Row = 3;
            app.meanEditFieldLabel.Layout.Column = 1;
            app.meanEditFieldLabel.Text = 'mean';

            % Create XMeanAccelEditField
            app.XMeanAccelEditField = uieditfield(app.GridLayout12, 'numeric');
            app.XMeanAccelEditField.Layout.Row = 3;
            app.XMeanAccelEditField.Layout.Column = [2 3];

            % Create maximalEditField_2Label
            app.maximalEditField_2Label = uilabel(app.GridLayout12);
            app.maximalEditField_2Label.HorizontalAlignment = 'right';
            app.maximalEditField_2Label.Layout.Row = 5;
            app.maximalEditField_2Label.Layout.Column = 1;
            app.maximalEditField_2Label.Text = 'maximal';

            % Create YMaximalAccelEditField
            app.YMaximalAccelEditField = uieditfield(app.GridLayout12, 'numeric');
            app.YMaximalAccelEditField.Layout.Row = 5;
            app.YMaximalAccelEditField.Layout.Column = [2 3];

            % Create meanEditField_2Label
            app.meanEditField_2Label = uilabel(app.GridLayout12);
            app.meanEditField_2Label.HorizontalAlignment = 'right';
            app.meanEditField_2Label.Layout.Row = 6;
            app.meanEditField_2Label.Layout.Column = 1;
            app.meanEditField_2Label.Text = 'mean';

            % Create YMeanAccelEditField
            app.YMeanAccelEditField = uieditfield(app.GridLayout12, 'numeric');
            app.YMeanAccelEditField.Layout.Row = 6;
            app.YMeanAccelEditField.Layout.Column = [2 3];

            % Create maximalEditField_3Label
            app.maximalEditField_3Label = uilabel(app.GridLayout12);
            app.maximalEditField_3Label.HorizontalAlignment = 'right';
            app.maximalEditField_3Label.Layout.Row = 8;
            app.maximalEditField_3Label.Layout.Column = 1;
            app.maximalEditField_3Label.Text = 'maximal';

            % Create ZMaximalAccelEditField
            app.ZMaximalAccelEditField = uieditfield(app.GridLayout12, 'numeric');
            app.ZMaximalAccelEditField.Layout.Row = 8;
            app.ZMaximalAccelEditField.Layout.Column = [2 3];

            % Create meanEditField_3Label
            app.meanEditField_3Label = uilabel(app.GridLayout12);
            app.meanEditField_3Label.HorizontalAlignment = 'right';
            app.meanEditField_3Label.Layout.Row = 9;
            app.meanEditField_3Label.Layout.Column = 1;
            app.meanEditField_3Label.Text = 'mean';

            % Create ZMeanAccelEditField
            app.ZMeanAccelEditField = uieditfield(app.GridLayout12, 'numeric');
            app.ZMeanAccelEditField.Layout.Row = 9;
            app.ZMeanAccelEditField.Layout.Column = [2 3];

            % Create xdirectionLabel
            app.xdirectionLabel = uilabel(app.GridLayout12);
            app.xdirectionLabel.HorizontalAlignment = 'center';
            app.xdirectionLabel.Layout.Row = 1;
            app.xdirectionLabel.Layout.Column = [1 3];
            app.xdirectionLabel.Text = 'x-direction';

            % Create ydirectionLabel
            app.ydirectionLabel = uilabel(app.GridLayout12);
            app.ydirectionLabel.HorizontalAlignment = 'center';
            app.ydirectionLabel.Layout.Row = 4;
            app.ydirectionLabel.Layout.Column = [1 3];
            app.ydirectionLabel.Text = 'y-direction';

            % Create zdirectionLabel
            app.zdirectionLabel = uilabel(app.GridLayout12);
            app.zdirectionLabel.HorizontalAlignment = 'center';
            app.zdirectionLabel.Layout.Row = 7;
            app.zdirectionLabel.Layout.Column = [1 3];
            app.zdirectionLabel.Text = 'z-direction';

            % Create bagFile_2
            app.bagFile_2 = uieditfield(app.GridLayout12, 'text');
            app.bagFile_2.Placeholder = 'C:\\img1.bag';
            app.bagFile_2.Layout.Row = 11;
            app.bagFile_2.Layout.Column = [2 3];

            % Create content2_3
            app.content2_3 = uilabel(app.GridLayout12);
            app.content2_3.Layout.Row = 11;
            app.content2_3.Layout.Column = 1;
            app.content2_3.Text = 'Path .bag file';

            % Create LoadDataButton_2
            app.LoadDataButton_2 = uibutton(app.GridLayout12, 'push');
            app.LoadDataButton_2.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButton_2Pushed, true);
            app.LoadDataButton_2.Layout.Row = 12;
            app.LoadDataButton_2.Layout.Column = 3;
            app.LoadDataButton_2.Text = 'Load Data';

            % Create SearchFileButton_4
            app.SearchFileButton_4 = uibutton(app.GridLayout12, 'push');
            app.SearchFileButton_4.ButtonPushedFcn = createCallbackFcn(app, @SearchFileButton_4Pushed, true);
            app.SearchFileButton_4.Layout.Row = 12;
            app.SearchFileButton_4.Layout.Column = 2;
            app.SearchFileButton_4.Text = 'Search File';

            % Create UseCurrentButton
            app.UseCurrentButton = uibutton(app.GridLayout12, 'push');
            app.UseCurrentButton.ButtonPushedFcn = createCallbackFcn(app, @UseCurrentButtonPushed, true);
            app.UseCurrentButton.Layout.Row = 12;
            app.UseCurrentButton.Layout.Column = 1;
            app.UseCurrentButton.Text = 'Use Current';

            % Create ConvertTab
            app.ConvertTab = uitab(app.TabGroup);
            app.ConvertTab.Title = 'Convert';

            % Create GridLayout_2
            app.GridLayout_2 = uigridlayout(app.ConvertTab);
            app.GridLayout_2.ColumnWidth = {'1x', '1x', '1x', '1x'};
            app.GridLayout_2.RowHeight = {'30x', '25x', '5x', '5x', '5x', '50x'};
            app.GridLayout_2.RowSpacing = 4.4;
            app.GridLayout_2.Padding = [10 4.4 10 4.4];

            % Create RGBDepthImage
            app.RGBDepthImage = uiaxes(app.GridLayout_2);
            title(app.RGBDepthImage, 'Depth')
            app.RGBDepthImage.XTick = [];
            app.RGBDepthImage.YTick = [];
            app.RGBDepthImage.Layout.Row = [3 6];
            app.RGBDepthImage.Layout.Column = [1 2];

            % Create ConvertedPointcloudImage
            app.ConvertedPointcloudImage = uiaxes(app.GridLayout_2);
            title(app.ConvertedPointcloudImage, 'Pointcloud')
            app.ConvertedPointcloudImage.XTick = [];
            app.ConvertedPointcloudImage.YTick = [];
            app.ConvertedPointcloudImage.Layout.Row = [3 6];
            app.ConvertedPointcloudImage.Layout.Column = [3 4];

            % Create ConvertbagdepthtoplypointcloudPanel
            app.ConvertbagdepthtoplypointcloudPanel = uipanel(app.GridLayout_2);
            app.ConvertbagdepthtoplypointcloudPanel.Title = 'Convert .bag depth to .ply pointcloud';
            app.ConvertbagdepthtoplypointcloudPanel.Layout.Row = 1;
            app.ConvertbagdepthtoplypointcloudPanel.Layout.Column = [1 2];

            % Create GridLayout9_2
            app.GridLayout9_2 = uigridlayout(app.ConvertbagdepthtoplypointcloudPanel);
            app.GridLayout9_2.ColumnWidth = {'1x', '3x', '3x'};
            app.GridLayout9_2.RowHeight = {'1x', '1x', '1x'};

            % Create bagfileEditFieldLabel
            app.bagfileEditFieldLabel = uilabel(app.GridLayout9_2);
            app.bagfileEditFieldLabel.HorizontalAlignment = 'right';
            app.bagfileEditFieldLabel.Layout.Row = 1;
            app.bagfileEditFieldLabel.Layout.Column = 1;
            app.bagfileEditFieldLabel.Text = '.bag file';

            % Create ConvertBagFilePathField
            app.ConvertBagFilePathField = uieditfield(app.GridLayout9_2, 'text');
            app.ConvertBagFilePathField.Placeholder = 'C:\\img1.bag';
            app.ConvertBagFilePathField.Layout.Row = 1;
            app.ConvertBagFilePathField.Layout.Column = [2 3];

            % Create SearchConvertBagFileButton
            app.SearchConvertBagFileButton = uibutton(app.GridLayout9_2, 'push');
            app.SearchConvertBagFileButton.ButtonPushedFcn = createCallbackFcn(app, @SearchConvertBagFileButtonPushed, true);
            app.SearchConvertBagFileButton.Layout.Row = 2;
            app.SearchConvertBagFileButton.Layout.Column = 2;
            app.SearchConvertBagFileButton.Text = 'Search';

            % Create SaveAspointcloudButton
            app.SaveAspointcloudButton = uibutton(app.GridLayout9_2, 'push');
            app.SaveAspointcloudButton.ButtonPushedFcn = createCallbackFcn(app, @SaveAspointcloudButtonPushed, true);
            app.SaveAspointcloudButton.Layout.Row = 2;
            app.SaveAspointcloudButton.Layout.Column = 3;
            app.SaveAspointcloudButton.Text = 'Save As Pointcloud';

            % Create plyfileEditFieldLabel
            app.plyfileEditFieldLabel = uilabel(app.GridLayout9_2);
            app.plyfileEditFieldLabel.HorizontalAlignment = 'right';
            app.plyfileEditFieldLabel.Layout.Row = 3;
            app.plyfileEditFieldLabel.Layout.Column = 1;
            app.plyfileEditFieldLabel.Text = '.ply file';

            % Create ConvertedPlyLocation
            app.ConvertedPlyLocation = uieditfield(app.GridLayout9_2, 'text');
            app.ConvertedPlyLocation.Editable = 'off';
            app.ConvertedPlyLocation.Placeholder = 'C:\\img1.ply';
            app.ConvertedPlyLocation.Layout.Row = 3;
            app.ConvertedPlyLocation.Layout.Column = 2;

            % Create UseConvertedPointcloudButton
            app.UseConvertedPointcloudButton = uibutton(app.GridLayout9_2, 'push');
            app.UseConvertedPointcloudButton.ButtonPushedFcn = createCallbackFcn(app, @UseConvertedPointcloudButtonPushed, true);
            app.UseConvertedPointcloudButton.Layout.Row = 3;
            app.UseConvertedPointcloudButton.Layout.Column = 3;
            app.UseConvertedPointcloudButton.Text = 'Use Files';

            % Create ExportsPanel
            app.ExportsPanel = uipanel(app.GridLayout_2);
            app.ExportsPanel.Title = 'Exports';
            app.ExportsPanel.Layout.Row = 1;
            app.ExportsPanel.Layout.Column = 4;

            % Create GridLayout9_3
            app.GridLayout9_3 = uigridlayout(app.ExportsPanel);
            app.GridLayout9_3.RowHeight = {'1x', '1x', '1x'};

            % Create ColourDepthButton
            app.ColourDepthButton = uibutton(app.GridLayout9_3, 'push');
            app.ColourDepthButton.ButtonPushedFcn = createCallbackFcn(app, @ColourDepthButtonPushed, true);
            app.ColourDepthButton.Layout.Row = 1;
            app.ColourDepthButton.Layout.Column = 1;
            app.ColourDepthButton.Text = 'Colour Depth';

            % Create RGBButton
            app.RGBButton = uibutton(app.GridLayout9_3, 'push');
            app.RGBButton.ButtonPushedFcn = createCallbackFcn(app, @RGBButtonPushed, true);
            app.RGBButton.Layout.Row = 1;
            app.RGBButton.Layout.Column = 2;
            app.RGBButton.Text = 'RGB';

            % Create LogTab
            app.LogTab = uitab(app.TabGroup);
            app.LogTab.Title = 'Log';

            % Create LogWindowArea
            app.LogWindowArea = uitextarea(app.LogTab);
            app.LogWindowArea.Position = [0 27 944 577];

            % Show the figure after all components are created
            app.LAIDetectionUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = LAI_calc_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.LAIDetectionUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.LAIDetectionUIFigure)
        end
    end
end