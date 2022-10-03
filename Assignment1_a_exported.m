classdef Assignment1_a_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        ApplypiecewiselinearmodificationButton  matlab.ui.control.Button
        UploadimageButton  matlab.ui.control.Button
        UIAxes4_2          matlab.ui.control.UIAxes
        UIAxes4            matlab.ui.control.UIAxes
        UIAxes3_2          matlab.ui.control.UIAxes
        UIAxes3            matlab.ui.control.UIAxes
        UIAxes2_2          matlab.ui.control.UIAxes
        UIAxes2            matlab.ui.control.UIAxes
        UIAxes             matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: UploadimageButton
        function UploadimageButtonPushed(app, event)
            global img; 
            [filename, pathname] = uigetfile('*.*', 'Pick an Image');
            filename=strcat(pathname,filename);
            img=imread(filename);
            imshow(img,'Parent',app.UIAxes);
        end

        % Button pushed function: ApplypiecewiselinearmodificationButton
        function ApplypiecewiselinearmodificationButtonPushed(app, event)
            global img;
            Img=img;
            Img_str=0;
            [rows,col] = size(Img);
            T1 = 0;  %upper threshold
            T2 = 80;  %lower threshold
            grid on;
            for i=1:rows
                for j=1:col
                    if((Img(i,j)>T1) && (Img(i,j)<T2));
                        Img_str(i,j)=255;
                    else
                        Img_str(i,j)=0;
                    end
                end
            end
            dd =[];
            hold on;
            dd(1:80)=255;
            dd(81:149)=0;
            dd(150:256)=0;
            plot(dd,'Parent',app.UIAxes2_2);
            imshow(Img_str,'Parent',app.UIAxes2);

            
            
            Img2_str=0;
            T1 = 80;  %upper threshold
            T2 = 150;  %lower threshold
            grid on;
            for i=1:rows
                for j=1:col
                    if((Img(i,j)>T1) && (Img(i,j)<T2));
                        Img2_str(i,j)=255;
                    else
                        Img2_str(i,j)=0;
                    end
                end
            end
            dd2 =[];
            hold on;
            dd2(1:80)=0;
            dd2(81:149)=255;
            dd2(150:256)=0;
            plot(dd2,'Parent',app.UIAxes3_2);
            imshow(Img2_str,'Parent',app.UIAxes3);



            Img3_str=0;
            T1 = 151;  %upper threshold
            T2 = 255;  %lower threshold
            grid on;
            for i=1:rows
                for j=1:col
                    if((Img(i,j)>T1) && (Img(i,j)<T2));
                        Img3_str(i,j)=255;
                    else
                        Img3_str(i,j)=0;
                    end
                end
            end
            dd3 =[];
            hold on;
            dd3(1:80)=0;
            dd3(81:149)=0;
            dd3(150:256)=255;
            plot(dd3,'Parent',app.UIAxes4_2);
            imshow(Img3_str,'Parent',app.UIAxes4);

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 952 894];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Orignal Image')
            app.UIAxes.Position = [19 665 300 185];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, 'Result (a)')
            app.UIAxes2.Position = [20 261 254 188];

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.UIFigure);
            title(app.UIAxes2_2, 'Slicing transformation function (a)')
            app.UIAxes2_2.Position = [19 49 254 188];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.UIFigure);
            title(app.UIAxes3, 'Result(b)')
            app.UIAxes3.Position = [340 262 244 184];

            % Create UIAxes3_2
            app.UIAxes3_2 = uiaxes(app.UIFigure);
            title(app.UIAxes3_2, 'Slicing transformation function (b)')
            app.UIAxes3_2.Position = [338 50 254 184];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.UIFigure);
            title(app.UIAxes4, 'Result(c)')
            app.UIAxes4.Position = [665 255 232 194];

            % Create UIAxes4_2
            app.UIAxes4_2 = uiaxes(app.UIFigure);
            title(app.UIAxes4_2, 'Slicing transformation function (c)')
            app.UIAxes4_2.Position = [663 47 232 190];

            % Create UploadimageButton
            app.UploadimageButton = uibutton(app.UIFigure, 'push');
            app.UploadimageButton.ButtonPushedFcn = createCallbackFcn(app, @UploadimageButtonPushed, true);
            app.UploadimageButton.Position = [401 726 163 62];
            app.UploadimageButton.Text = 'Upload image';

            % Create ApplypiecewiselinearmodificationButton
            app.ApplypiecewiselinearmodificationButton = uibutton(app.UIFigure, 'push');
            app.ApplypiecewiselinearmodificationButton.ButtonPushedFcn = createCallbackFcn(app, @ApplypiecewiselinearmodificationButtonPushed, true);
            app.ApplypiecewiselinearmodificationButton.Position = [65 521 209 66];
            app.ApplypiecewiselinearmodificationButton.Text = 'Apply piece wise  linear modification';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Assignment1_a_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end