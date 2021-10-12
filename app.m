% classdef app < matlab.apps.AppBase
% 
%     % Properties that correspond to app components
%     properties (Access = public)
%         UIFigure            matlab.ui.Figure
%         TestEditField       matlab.ui.control.NumericEditField
%         TestEditFieldLabel  matlab.ui.control.Label
%         ppnafilButton       matlab.ui.control.Button
%         SparafilButton      matlab.ui.control.Button
%         SpelainButton       matlab.ui.control.Button
%         UIAxes              matlab.ui.control.UIAxes
%     end
% 
%     
%     properties (Access = private)
%         dq
%         data
%     end
%     
%     methods (Access = private)
%         
%         function Init(app)
%             app.dq = daq("ni");
%             app.dq.Rate = 0.2;
%             addinput(app.dq, "Dev1", "ai0", "Voltage");
%             
%         end
%         
%         function UpdateData(app)
%             %while true
%                 
%                 print(app.data);
%                 plot(app.UIAxes, app.data.Time, app.data.Variables);
%             %end
%         end
%     end
%     
% 
%     % Callbacks that handle component events
%     methods (Access = private)
% 
%         % Code that executes after component creation
%         function startupFcn(app)
%             Init(app);
%             readData(app);
%             UpdateData(app);
%         end
% 
%         % Value changed function: TestEditField
%         function TestEditFieldValueChanged(app, event)
%             value = app.TestEditField.Value;
%             set(app.UIAxes, "XLim", [0 value]);
%         end
%     end
% 
%     % Component initialization
%     methods (Access = private)
% 
%         % Create UIFigure and components
%         function createComponents(app)
% 
%             % Create UIFigure and hide until all components are created
%             app.UIFigure = uifigure('Visible', 'off');
%             app.UIFigure.Position = [100 100 640 480];
%             app.UIFigure.Name = 'MATLAB App';
% 
%             % Create UIAxes
%             app.UIAxes = uiaxes(app.UIFigure);
%             title(app.UIAxes, 'Spänningsdiagram')
%             xlabel(app.UIAxes, 'Tid (s)')
%             ylabel(app.UIAxes, 'Spänning (V)')
%             zlabel(app.UIAxes, 'Z')
%             app.UIAxes.Position = [1 107 640 374];
% 
%             % Create SpelainButton
%             app.SpelainButton = uibutton(app.UIFigure, 'push');
%             app.SpelainButton.Position = [40 66 130 34];
%             app.SpelainButton.Text = 'Spela in';
% 
%             % Create SparafilButton
%             app.SparafilButton = uibutton(app.UIFigure, 'push');
%             app.SparafilButton.Position = [200 66 130 34];
%             app.SparafilButton.Text = 'Spara fil';
% 
%             % Create ppnafilButton
%             app.ppnafilButton = uibutton(app.UIFigure, 'push');
%             app.ppnafilButton.Position = [200 13 130 34];
%             app.ppnafilButton.Text = 'Öppna fil';
% 
%             % Create TestEditFieldLabel
%             app.TestEditFieldLabel = uilabel(app.UIFigure);
%             app.TestEditFieldLabel.HorizontalAlignment = 'right';
%             app.TestEditFieldLabel.Position = [402 72 55 22];
%             app.TestEditFieldLabel.Text = 'Test';
% 
%             % Create TestEditField
%             app.TestEditField = uieditfield(app.UIFigure, 'numeric');
%             app.TestEditField.ValueChangedFcn = createCallbackFcn(app, @TestEditFieldValueChanged, true);
%             app.TestEditField.Position = [472 72 100 22];
% 
%             % Show the figure after all components are created
%             app.UIFigure.Visible = 'on';
%         end
%     end
% 
%     % App creation and deletion
%     methods (Access = public)
% 
%         % Construct app
%         function app = app
% 
%             % Create UIFigure and components
%             createComponents(app)
% 
%             % Register the app with App Designer
%             registerApp(app, app.UIFigure)
% 
%             % Execute the startup function
%             runStartupFcn(app, @startupFcn)
% 
%             if nargout == 0
%                 clear app
%             end
%         end
% 
%         % Code that executes before app deletion
%         function delete(app)
% 
%             % Delete UIFigure when app is deleted
%             delete(app.UIFigure)
%         end
%     end
% end

daqlist("ni")
dq = daq("ni");
dq.Rate = 1;
addinput(dq, "Dev1", "ai0", "Voltage");

start(dq,"Continuous");

%function readData(app)
data = read(dq, 5)
%end