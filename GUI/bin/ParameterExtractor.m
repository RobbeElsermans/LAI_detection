classdef ParameterExtractor
    %slaagt de data gekregen van andere componenten, op in een log bestand.
    %   Deze classe wordt gebruikt om het aanmaken en bijhouden van log
    %   bestanden in de GUI.
    
    properties (Access = private)
        file_path = "" 
        file_name = ""
        file = ""
        default_value
    end
    
    methods
        function obj = ParameterExtractor(file, default_value_struct)
            %LOGGER Construct an instance of this class
            %   file_path is relatief vanuit de logger. Het bestand wordt
            %   per dag nieuw gemaakt

            obj.file_path = ".\params\";
            obj.default_value = default_value_struct;

            % https://www.mathworks.com/help/matlab/ref/datetime.html
            % prepareer de file name en naam
            obj.file_name = file;
            obj.file = strcat(obj.file_path, obj.file_name);

            % Check if default file exists, otherwize write the default
            % values to it.
            if obj.checkExist() == 0
                obj.WriteDataToFile(obj.default_value)
            end

        end
        
        function data = ReadData(obj)
            % Read parameter data
            try
                data = readstruct(obj.file);
            catch error_read
                % file has been deleted, reimport file with known values 
                
                if obj.checkExist() == 0
                    obj.WriteDataToFile(obj.default_value)
                end

                data = obj.default_value;
            end
            
        end

        function data = ReadDataFromFile(obj)
            % Read parameter data
            try
                data = readstruct(obj.file);
            catch error_read
                % file has been deleted, reimport file with known values 
                
                if obj.checkExist() == 0
                    obj.WriteDataToFile(obj.default_value)
                end

                data = obj.default_value;
            end
            
        end

        function error = WriteDataToFile(obj,data)
            %Write data to a new file inside the file_path folder
            error = "";

            %new_file = strcat(obj.file_path, file_name);

            try
                if obj.checkExist() == 0 % if the file doesn't exist
                    fclose(fopen(obj.file, "w"));
                end

                writestruct(data, obj.file, PrettyPrint=true, FileType="json");
            catch error_read
                
                error = error_read.message;
            end
        end

        function existed = checkExist(obj)
            if exist(obj.file, "file")
                %disp("file exists");
                existed = 1;
            else
                existed = 0;
                % obj.WriteDataToFile(obj.default_value, obj.file_name)
            end

        end

        function setFilePath(obj, new_file_name)
            % https://www.mathworks.com/help/matlab/ref/datetime.html
            % prepareer de file name en naam
            obj.file = new_file_name;
            %obj.file = strcat(obj.file_path, obj.file_name);

            % Check if default file exists, otherwize write the default
            % values to it.
            if obj.checkExist() == 0
                obj.WriteDataToFile(obj.default_value);
            end
        end
    end
end