% Flash_Task_Final
%
% This program presents one or two visual flashes that are either
% unaccompanied or accompanied by a single auditory beep or two auditory
% beeps.  It has been stripped down from a previous program which involved
% multiple stimuli positions.
%
%This version created at Franz 1/11/2010 in order to add triggers to indicate
%accuracy
%
% 2(Flashes: 1 / 2) X 3(Beeps: 0 / 1 / 2)
% The participants' numerosity judgments are recorded.
%
% Written by:  Katsumi Minakata 
% Date: 7/26/09
% Modified by: Zachary Moran
% Date: 1/11/2010
%--------------------------------------------------------------------------


clear all
PsychJavaTrouble

%-------------------------Experimenter Prompt------------------------------

prompt = {'Enter 3 subject initials: '};
         defaults = {'xxx'};
         answer = inputdlg(prompt, 'Subject Initials',1,defaults);
         [SUBJECT] = deal(answer{:});
         defaults = {'99'};
         uhr = clock;
         c = uhr;
         baseName=[SUBJECT(1:3) '_FLASH_' num2str(c(2)) '_' num2str(c(3)) ...
             '_' num2str(c(4)) '_' num2str(c(5))];
         
%--------------------------------------------------------------------------
         
%-------------------------Initialize Display-------------------------------

% MacBook Pro Screen Resolution = [1280 800]
global wPtr1
global yfix
global xfix
try
screens=Screen('Screens');
screenNum1=max(screens);
[wPtr1, rect] = Screen('OpenWindow', screenNum1, 0,[],[], 2);
VisP.wPtr = wPtr1;
VisP.rect = rect;
[center(1), center(2)] = RectCenter(rect);

Screen('BlendFunction', wPtr1, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% Create colors for wPtr
black = BlackIndex(wPtr1);
white = WhiteIndex(wPtr1);

% Find middle of screen
xfix = (center(1)-10);
yfix = (center(2)-4);

% -----Creating the top bottom factor parameters-----

% [1 2 3 4] 1=disc_neg_x 2=disc_pos_y 3=disc_pos_x 4=disc_neg_y

% Hard coded top disc individual parameters
t_Disc_Neg_X = 609;
t_Disc_Pos_Y = 187;
t_Disc_Pos_X = 672;
t_Disc_Neg_Y = 252;

% Hard coded bottom disc individual parameters
%b_Disc_Neg_X = 609;
%b_Disc_Pos_Y = 772;
%b_Disc_Pos_X = 672;
%b_Disc_Neg_Y = 837;

b_Disc_Neg_X = 690;
b_Disc_Pos_Y = 630;
b_Disc_Pos_X = 753;
b_Disc_Neg_Y = 695;

% top and bottom disc parameters arrays - ZM: this variable removed
top_Params = [t_Disc_Neg_X t_Disc_Pos_Y t_Disc_Pos_X t_Disc_Neg_Y];
bottom_Params = [b_Disc_Neg_X b_Disc_Pos_Y b_Disc_Pos_X b_Disc_Neg_Y];

% Messages
beginText = ['In this experiment you are asked to judge\n' ...
          'how many times a circle flashes on the screen.\n' ...
          'The circles will flash very quickly!\n' ...
          '\n' ...
          'These flashes may or may not be accompanied\n' ...
          'by beeps.\n' ...
          '\n' ...
          'Press  2  if you see the circle flash twice\n' ...
          'Press  3  if you see the circle flash three times\n' ...
          '\n' ...
          '\n' ...
          'Make sure to keep your eyes on the "+" throughout\n' ...
          ' the experiment.\n' ...    
          '\n' ...
          'Press any key to start experiment session.\n'];

%respText = 'How many flashes?';

waitText ='Press any key to start the experiment';

blockText = ['You may take a break now.\n' ...
             '\n' ...     
             '\n' ...  
             'Otherwise, press any key \n' ...
             'to start the next block.'];

textSize = 28;

%--------------------------------------------------------------------------

%-------------------Initialize Sound & PsychPortAudio----------------------

    % These were working on my macbook pro
    %
    % Create the sound parameters
    % b=sin(1:65);
    % shortBeepGap=round(7.8*50);


% These tones work on the VMP lab
b=sin(1:150);
shortBeepGap=round(21.8*50);

% These tones have a short silence gap before they begin b/c of PPA
bp1=[zeros(1,shortBeepGap),b,zeros(1,shortBeepGap)];
bp2=[zeros(1,shortBeepGap),bp1,b,zeros(1,shortBeepGap)];
bp3=[zeros(1,shortBeepGap),b,zeros(1,shortBeepGap),b,zeros(1,shortBeepGap),b,zeros(1,shortBeepGap)];

ESC_KEY='ESCAPE';


%--------------------------------------------------------------------------

%----------------------------Test Variables--------------------------------

trPerCond=1; % Switch back to 1 when debuging, 20 for experiment.
%blockSize=60; % Change back to real blockSize!
blockSize=20; % Change back to real blockSize (30 ZM)!

%TB=2;
Flashes=2;
Beeps=3;
responsetime=2.5;

%--------------------------------------------------------------------------

%-----------------------------Trial Matrix---------------------------------

%TBMat = sort(repmat([1 2], 1, trPerCond * Flashes * Beeps))';
%FlashesMat = repmat(sort(repmat([1 2] , 1, trPerCond * Beeps)) , 1, TB)';
FlashesMat = repmat(sort(repmat([2 3] , 1, trPerCond * Beeps)) , 1, 1)';
%BeepsMat = repmat([0 1 2], 1, trPerCond * TB * Flashes)';
BeepsMat = repmat([0 2 3], 1, trPerCond * 1 * Flashes)';

%trMat = [TBMat FlashesMat BeepsMat];
%trMat = [FlashesMat BeepsMat];

trMat =  [2 0;
          3 0;
          2 2;
          3 3;];
      
trMat=repmat(trMat,trPerCond,1);
mixtr = trMat;
%mixtr = trMat(randperm(length(trMat)),:);
%testing mixtr
%mixtr=[2 2;2 2;2 2;2 2;2 2;2 2];
respMat=zeros(length(mixtr),1)-1; % intialize response matrix with -1
resptime = zeros(length(mixtr),1)-1;
accMat = zeros(length(mixtr),1)-1;



%--------------------------------------------------------------------------

%---------------------Black out screen for Start of Exp---------------------

Screen('FillRect', wPtr1, black);
Screen('Flip', wPtr1);

HideCursor;
tic;

while toc<1;

end

%--------------------------------------------------------------------------

%-------------------Prompt for Beginning of Experiment---------------------

Screen('TextSize', wPtr1 , textSize);
Screen('TextFont', wPtr1, 'Arial');
DrawFormattedText(wPtr1, beginText, 'center', 'center', [255 255 255]);
Screen('Flip', wPtr1);
     % Wait for key stroke. This will first make sure all keys are
     % released, then wait for a keypress and release:
KbWait([], 2);

%--------------------------------------------------------------------------

%--------------------------Beginning of Experiment-------------------------

for trial = 1 : length(mixtr);
    

    Screen('FillRect', wPtr1, black);
    Screen('Flip', wPtr1);
    
    WaitSecs(1);
    
    % breaks between blocks
    if (mod(trial,blockSize)==1);
        if trial==1;

        Screen('TextSize', wPtr1 , 50);
        Screen('FillRect', wPtr1, black);
        DrawFormattedText(wPtr1, waitText, ...
            'center', 'center', [255 255 255]);
        Screen('Flip', wPtr1);
        KbWait([], 2);
        
        else
        
        Screen('TextSize', wPtr1 , 50);
        Screen('FillRect', wPtr1, black);
        DrawFormattedText(wPtr1, blockText, ...
            'center', 'center', [255 255 255]);
        Screen('Flip', wPtr1);
        KbWait([], 2);
        
        end      
    end
    
    % This determines whether the disc position will be on the top or bottom
    %if mixtr(trial, 1)==1
    %    discPos=top_Params;
    %else
    %    discPos=bottom_Params;
        
    %end
    discPos=bottom_Params;
    
    % This determines whether there will be zero, one, or two beeps
    %if mixtr(trial, 3)==0
    if mixtr(trial, 2)==0
        numBeeps=0;
    %elseif mixtr(trial, 3)==1
    elseif mixtr(trial, 2)==2
        numBeeps=bp2;
    %elseif mixtr(trial, 3)==2
    elseif mixtr(trial, 2)==3
        numBeeps=bp3;
    end
 
    
    % Presents the experimental2 stimuli
    %SIF(discPos, numBeeps, trial, mixtr, wPtr1, xfix, yfix, black)
    ZSIF_triggers2(discPos, numBeeps, trial, mixtr, wPtr1, xfix, yfix, black)
    
    %----Get Respones and response time (Zwaitfor_response function) - saving
    %sequence
    [resptime(trial) respMat(trial)] = Zwaitfor_response(responsetime);   
    
    % -----Continue saving sequence-----
    Screen('FillRect', wPtr1, black);
    %Screen('TextSize', wPtr1 , textSize);
    %Screen('TextFont', wPtr1, 'Arial');
    
    %DrawFormattedText(wPtr1, respText, 'center', 'center', [255 255 255]);  
    Screen('Flip', wPtr1);
        
   % [resptime(trial) respMat(trial)] = Zwaitforkey_1(responsetime, 0, []);  
    
    % Checking for proper response key   
   % while (respMat(trial) ~= 31 && respMat(trial) ~= 30 && resptime(trial) ~= -1)
   %     [resptime(trial) respMat(trial)] = Zwaitforkey_1(responsetime, 0, respMat(trial));
   % end 
     %[resptime(trial) respMat(trial)] = Zwaitfor_response(responsetime);
    
     %Get Respones and response time (Zwaitfor_response function)

    
    %Check for accuracy
% create an instance of the io32 object
%ioObj=io32;
% initialize the inpout32.dll system driver
%status=io32(ioObj);
%if status = 0, you are now ready to write and read to a hardware port

if mixtr(trial, 1)==2 && mixtr(trial, 2)==0
    if respMat(trial, 1)==50 || respMat(trial, 1)==98
        accMat(trial, 1) = 1;
        %io32(ioObj,888,1);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    elseif respMat(trial, 1)~=50 || respMat(trial, 1)~=98
        accMat(trial, 1) = 0;
        %io32(ioObj,888,2);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    end
elseif mixtr(trial, 1)==2 && mixtr(trial, 2)==2
    if respMat(trial, 1)==50 || respMat(trial, 1)==98 
        accMat(trial, 1) = 1;
        %io32(ioObj,888,1);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    elseif respMat(trial, 1)~=50 || respMat(trial, 1)~=98
        accMat(trial, 1) = 0;
        %io32(ioObj,888,2);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    end
elseif mixtr(trial, 1)==2 && mixtr(trial, 2)==3
    if respMat(trial, 1)==50 || respMat(trial, 1)==98
        accMat(trial, 1)= 1;
        %io32(ioObj,888,1);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    elseif respMat(trial, 1)==51 || respMat(trial, 1)==99
        accMat(trial, 1)= 0;
        %io32(ioObj,888,3);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    elseif (respMat(trial, 1)~=50 && respMat(trial, 1)~=51) || (respMat(trial, 1)~=98 && respMat(trial, 1)~=99)
        accMat(trial, 1)= 0;
        %io32(ioObj,888,2);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    end

elseif mixtr(trial, 1)==3 
    if respMat(trial, 1)==51 || respMat(trial, 1)==99
        accMat(trial, 1)= 1;
        %io32(ioObj,888,1);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    elseif respMat(trial, 1)~=51 || respMat(trial, 1)~=99
        accMat(trial, 1)= 0;
        %io32(ioObj,888,2);
        WaitSecs(.01);
        %io32(ioObj,888,0);
    end
end
clear ioObj;
Totalscore=(sum(accMat)/length(mixtr))*100;
  save(baseName);   
    % -----End of saving sequence-----
    
    if trial == length(mixtr)
        Screen('FillRect', wPtr1, black);
        Screen('TextSize', wPtr1 , 34);
        Screen('TextFont', wPtr1, 'Arial');
    
        DrawFormattedText(wPtr1, 'THANK YOU VERY MUCH FOR YOUR PARTICIPATION!!!!', ...
            'center', 'center', [255 255 255]);
        Screen('Flip', wPtr1);
        KbWait([], 2);
    end  
end
     ShowCursor; %ZM added 9/22
    Screen('CloseAll'); %or sca  ZM added 9/22 
catch
    % This section is executed only in case an error happens in the
    % experiment code implemented between try and catch...
    ShowCursor;
    Screen('CloseAll'); %or sca
    ListenChar(0);
   % Screen('Preference', 'VisualDebuglevel', olddebuglevel);
    %output the error message
    psychrethrow(psychlasterror);
%-----------------------------End of Experiment----------------------------

%---------------------Close Screen, & Show Cursor---------------------

Screen('CloseAll');
ShowCursor;
end


