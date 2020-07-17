function ZSIF_triggers2(discPos, numBeeps, trial, mixtr, wPtr1, xfix, yfix, black, text)

% create an instance of the io32 object
%ioObj=io32;
% initialize the inpout32.dll system driver
%status=io32(ioObj);
%if status = 0, you are now ready to write and read to a hardware port

freq=20000;
nrchannels=1;

textSize = 36;
Screen('TextSize', wPtr1 , textSize);
Screen('TextFont', wPtr1, 'Arial');


%BRIAN - Commented these out.
InitializePsychSound(1);
pahandle = PsychPortAudio('Open', [], [], 0, freq, nrchannels, [], [], []);

%if mixtr(trial, 2)==1 % this refers to the "flashes" column of mixtr
if mixtr(trial, 1)==0
    switch mixtr(trial, 2)
        case 1
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.27, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t4);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 2
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.27, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t4);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 3
                        Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.27, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t4);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 4
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.27, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t4);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
    end

elseif mixtr(trial, 1)==1 % this refers to the "flashes" column of mixtr
    %switch mixtr(trial, 3)
    switch mixtr(trial, 2)
        case 0
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t1 ]=Screen('Flip', wPtr1);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35);
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            %WaitSecs(.018);
            %io32(ioObj,888,10);
           
            
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t4);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
            %io32(ioObj,888,0);
            
        case 1
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.13, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.155);
            %io32(ioObj,888,20);
           
            
            
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t5);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
            %io32(ioObj,888,0);
        case 2    
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.21, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1); 
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);   
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.281);
            %io32(ioObj,888,30);
           
            
            
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4 + .015); 
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t5);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
            %io32(ioObj,888,0);
        case 3
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.26, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);  
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);   
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.281);
            %io32(ioObj,888,30);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4); 
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t5);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 4
            %BRIAN - stuff needed here!!!
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.26, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);   
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);   
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.281);
            %io32(ioObj,888,30);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4); 
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t5);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
    end
%elseif mixtr(trial, 2)==2
elseif mixtr(trial, 1)==2
    %switch mixtr(trial, 3)
    switch mixtr(trial, 2)
        case 0
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t1 ]=Screen('Flip', wPtr1);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t7 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
            %io32(ioObj,888,0);
        case 1
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.132, []);
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.120);
            %io32(ioObj,888,50);
            
            
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .009);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t7 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t7 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
            %io32(ioObj,888,0);
        case 2
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.125, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.201);
            %io32(ioObj,888,60);
            
            
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .011);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('FillOval', wPtr1, [255 255 255], discPos);
            [t8 ]=Screen('Flip', wPtr1, t7 + .009);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t7 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
            %io32(ioObj,888,0);
        case 3
            %BRIAN - stuff needed here.
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.18, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.201);
            %io32(ioObj,888,60);
            
            
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .011);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('FillOval', wPtr1, [255 255 255], discPos);
            [t8 ]=Screen('Flip', wPtr1, t7 + .009);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t7 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 4
            %BRIAN - stuff needed here.
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.18, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1);
            WaitSecs(1.0)
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t3 ]=Screen('Flip', wPtr1, t2 + .3);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.201);
            %io32(ioObj,888,60);
            
            
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .011);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('FillOval', wPtr1, [255 255 255], discPos);
            [t8 ]=Screen('Flip', wPtr1, t7 + .011);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t7 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);

    end
elseif mixtr(trial, 1)==3
    switch mixtr(trial, 2)
        case 0
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
  
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 1
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.40, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
  
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 2
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.32, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.03);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
  
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 3
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.34, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
  
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 4
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.34, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .38); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
  
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
    end
elseif mixtr(trial, 1)==4
    switch mixtr(trial, 2)
        case 0 
            Screen('FillRect', wPtr1, black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t1 ]=Screen('Flip', wPtr1);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .015);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
            
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            [t11 ]=Screen('Flip', wPtr1, t10 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t12 ]=Screen('Flip', wPtr1, t11 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t13 ]=Screen('Flip', wPtr1, t12 + .0215);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 1
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.435, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
            
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.002);
            %io32(ioObj,888,40);
            [t11 ]=Screen('Flip', wPtr1, t10 + .01);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t12 ]=Screen('Flip', wPtr1, t11 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t13 ]=Screen('Flip', wPtr1, t12 + .0215);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 2
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.35, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
            
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.002);
            %io32(ioObj,888,40);
            [t11 ]=Screen('Flip', wPtr1, t10 + .01);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t12 ]=Screen('Flip', wPtr1, t11 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t13 ]=Screen('Flip', wPtr1, t12 + .0215);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 3
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.37, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35); 
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
            
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.002);
            %io32(ioObj,888,40);
            [t11 ]=Screen('Flip', wPtr1, t10 + .01);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t12 ]=Screen('Flip', wPtr1, t11 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t13 ]=Screen('Flip', wPtr1, t12 + .0215);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
        case 4
            Screen('FillRect', wPtr1, black);
            [t1 ]=Screen('Flip', wPtr1);
            PsychPortAudio('FillBuffer', pahandle, numBeeps);
            PsychPortAudio('Start', pahandle, 1, t1 + 1.34, []);
            Screen('FillRect', wPtr1,black);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t2 ]=Screen('Flip', wPtr1, t1 + .35);
            WaitSecs(1.0)
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.018);
            %io32(ioObj,888,40);
            
            [t3 ]=Screen('Flip', wPtr1, t2 + .02);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t4 ]=Screen('Flip', wPtr1, t3);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t5 ]=Screen('Flip', wPtr1, t4);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.005);
            [t6 ]=Screen('Flip', wPtr1, t5);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t7 ]=Screen('Flip', wPtr1, t6 + .020);
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.0363);
            %io32(ioObj,888,40);
            [t8 ]=Screen('Flip', wPtr1, t7 + .03);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t9 ]=Screen('Flip', wPtr1, t8 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t10 ]=Screen('Flip', wPtr1, t9 + .0215);
            
            Screen('FillOval',wPtr1,[255 255 255], discPos);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            WaitSecs(.002);
            %io32(ioObj,888,40);
            [t11 ]=Screen('Flip', wPtr1, t10 + .01);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t12 ]=Screen('Flip', wPtr1, t11 + .015);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            [t13 ]=Screen('Flip', wPtr1, t12 + .0215);
            Screen('Drawtext', wPtr1, '+', xfix, yfix, [255 255 255]);
            Screen('Flip', wPtr1, t10 + .005);
            PsychPortAudio('Stop', pahandle, 1, [], [], []);
            PsychPortAudio('Close', pahandle);
    end
    
end

Screen('FillRect', wPtr1, black);
DrawFormattedText(wPtr1, text, 'center', 'center', [255 255 255]);
Screen('Flip', wPtr1);
end