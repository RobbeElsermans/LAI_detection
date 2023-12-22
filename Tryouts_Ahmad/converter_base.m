classdef converter_base
    properties (Access = protected)
        worker % Thread for main worker
        subWorkers % Array to store sub-workers
        framesMap % Map to store frames
    end
    
    methods (Access = protected)
        % Function to get and set frames in framesMap
        function flag = frames_map_get_and_set(~, streamType, frameNumber)
            % Simulated function, perform logic to get and set frames in map
            % Logic here to interact with framesMap
            flag = false; % Placeholder return value
        end
        
        % Function to wait for sub-workers
        function wait_sub_workers(~)
            % Simulated function, waiting for sub-workers to finish
            % Logic here to wait for sub-workers
        end
    end
    
    methods
        % Constructor
        function obj = converter_base()
            obj.worker = []; % Initialize worker thread
            obj.subWorkers = []; % Initialize sub-worker threads array
            obj.framesMap = containers.Map('KeyType', 'int32', 'ValueType', 'any'); % Initialize frames map
        end
        
        % Abstract methods to be implemented by subclasses
        methods (Abstract)
            convert(obj, frame); % Convert method
            name = name(obj); % Name method
        end
        
        % Virtual method to get statistics
        function statistics = get_statistics(obj)
            statistics = ''; % Placeholder for statistics
            % Simulated function to get statistics
            % Logic here to gather statistics
        end
        
        % Wait for workers to finish
        function wait(obj)
            if ~isempty(obj.worker)
                wait(obj.worker); % Wait for main worker
            end
            
            if ~isempty(obj.subWorkers)
                for i = 1:numel(obj.subWorkers)
                    wait(obj.subWorkers(i)); % Wait for sub-workers
                end
            end
        end
        
        % Start the main worker
        function start_worker(obj, f)
            obj.worker = thread(f); % Start the main worker thread
        end
        
        % Add sub-worker to the array
        function add_sub_worker(obj, f)
            obj.subWorkers = [obj.subWorkers, thread(f)]; % Add sub-worker thread
        end
    end
end
