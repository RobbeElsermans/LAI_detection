classdef converter_ply < converter_base
    properties (Access = protected)
        filePath % Store the file path
    end
    
    methods
        % Constructor
        function obj = converter_ply(filePath)
            obj.filePath = filePath;
        end
        
        % Override the name method
        function name = name(obj)
            name = 'PLY converter';
        end
        
        % Override the convert method
        function convert(obj, frame)
            % Emulate the start_worker function
            worker = @(~) ...
                begin
                    pc = pointCloud; % Simulate rs2::pointcloud
                    
                    frameset = frame.as('types.rs2.frameset'); % Simulate rs2::frameset
                    frameDepth = frameset.get_depth_frame();
                    frameColor = frameset.get_color_frame();
                    
                    if ~isempty(frameDepth) && ~isempty(frameColor)
                        % Simulate frames_map_get_and_set
                        if frames_map_get_and_set(RS2_STREAM_ANY, frameDepth.get_frame_number())
                            return;
                        end
                        
                        pc.map_to(frameColor);
                        
                        points = pc.calculate(frameDepth);
                        
                        % Simulate constructing filename and metadata_file strings
                        filename = strcat(obj.filePath, '_', num2str(frameDepth.get_timestamp(), '%.14f'), '.ply');
                        metadata_file = strcat(obj.filePath, '_metadata_', num2str(frameDepth.get_timestamp(), '%.14f'), '.txt');
                        
                        % Simulate exporting points to ply and metadata to txt file
                        export_to_ply(points, filename, frameColor);
                        metadata_to_txtfile(frameDepth, metadata_file);
                    end
        end
            
            % Simulate calling start_worker
            start_worker(worker);
        end
    end
end
