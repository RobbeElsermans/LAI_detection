% Specify the path to your .bag file
curbag = rosbag("..\");

% Create a bag file object
bag = rosbag(bagFilePath);

% Get list of available topics in the bag file
bag.AvailableTopics

% Specify the topic containing the point cloud data
pointCloudTopic = '/your/point_cloud/topic'; % Replace with your actual topic

% Read messages from the specified topic
pointCloudMessages = select(bag, 'Topic', pointCloudTopic);

% Loop through the messages and process the point cloud data
numMessages = pointCloudMessages.NumMessages;
for i = 1:numMessages
    % Read the point cloud message
    msg = readMessages(pointCloudMessages, i);
    
    % Process the point cloud data as needed
    % Example: Display the point cloud data
    figure;
    pcshow(msg{1}); % Display the point cloud
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title(['Point Cloud ', num2str(i)]);
end
