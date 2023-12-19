classdef Logger
    %slaagt de data gekregen van andere componenten, op in een log bestand.
    %   Deze classe wordt gebruikt om het aanmaken en bijhouden van log
    %   bestanden in de GUI.
    
    properties (Access = private)
        file_path = "" 
        file_name = ""
        file = ""
    end
    
    methods
        function obj = Logger()
            %LOGGER Construct an instance of this class
            %   file_path is relatief vanuit de logger. Het bestand wordt
            %   per dag nieuw gemaakt

            obj.file_path = ".\log\";

            % https://www.mathworks.com/help/matlab/ref/datetime.html
            % prepareer de file name en naam
            obj.file_name = strcat('log_', char(datetime("today")), ".log");
            obj.file = strcat(obj.file_path, obj.file_name);
            
            % open de file en schrijf de header
            temp_file_id = fopen(char(obj.file),'a');
            if temp_file_id == -1
                disp("No correct file found");
            else
                fprintf( ...
                    temp_file_id, "\r\n ------ New loggings beginning at %s ------\r\n", char(datetime("now","Format","HH:mm:ss")));
                fclose(temp_file_id);
            end
        end
        
        function writing_completed = WriteLog(obj,log_text)
            %WriteLog log de meegegeven text
            %   Zal een timestamp aan de logging geven
            writing_completed = true;

            temp_file_id = fopen(obj.file, 'a');
            if temp_file_id == -1
                writing_completed = false; % we kunnen niet schrijven naar de file
                disp("No correct file found");
            else
                fprintf( ...
                    temp_file_id, "%s\t%s\r\n", char(datetime("now","Format","HH:mm:ss")), log_text);
                fclose(temp_file_id);
            end
        end

        function writing_completed = WriteLogError(obj,log_text, error_text)
            %WriteLog log de meegegeven text
            %   Zal een timestamp aan de logging geven
            writing_completed = true;

            temp_file_id = fopen(obj.file, 'a');
            if temp_file_id == -1
                writing_completed = false; % we kunnen niet schrijven naar de file
                disp("No correct file found");
            else
                fprintf( ...
                    temp_file_id, "%s\t ERROR: %s\r\n ---- \r\n %s \r\n ---- \r\n", char(datetime("now","Format","HH:mm:ss")), log_text, error_text);
                fclose(temp_file_id);
            end
        end

        function log = GetCurrentLogging(obj)
            log = "";
            temp_file_id = fopen(obj.file, 'r');
            if temp_file_id == -1
                writing_completed = false; % we kunnen niet schrijven naar de file
                disp("No correct file found");
            else
                log = fscanf(temp_file_id, "%c");
            end
        end
    end
end