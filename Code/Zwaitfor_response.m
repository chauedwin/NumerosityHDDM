function [secs,keyCode] = Zwaitfor_response(responsetime)
% This code is intended to replace the waitforkey_1 function
% Note that KbWait is not very temporally accurate as it will only check
% every 5ms
starttime=GetSecs;
keepchecking = 1;

while (keepchecking == 1)
	[keyIsDown,secs,keyCode] = KbCheck(); % In while-loop, rapidly and continuously check if any key being pressed.
     if ~isempty(find(keyCode, 1)) % If key is being pressed...  ZM - Matlab recommended this change
		keepchecking = 0; % ... and end while-loop.
    elseif ((GetSecs - starttime)> responsetime)
        keepchecking = 0;
        keyCode=-1;
        secs=-1;
     end
    WaitSecs(.002);
end

stoptime=GetSecs;

if (secs~= -1)  %if user did not time out, assign keyCode and secs according to what/when key pressed
    secs = stoptime-starttime;
    keyCode = find(keyCode); 
    keyCode = keyCode(1); 
end
%escape key
if keyCode==27 
    error('ESCAPE key detected')
end
    
WaitSecs(1); %ZM added last minute to see if this would slow down the presentation
end