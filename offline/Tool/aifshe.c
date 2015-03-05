#include <direct.h> // for getcwd
#include <stdio.h>
#include <stdlib.h>// for MAX_PATH
#include <strings.h>
#include <windows.h>

int main(void)
{
  // _MAX_PATH is the maximum length allowed for a path
  char CurrentPath[_MAX_PATH];
  char SysLaunch[_MAX_PATH];
  char ArgLaunch[_MAX_PATH];
  // use the function to get the path
  getcwd(CurrentPath, _MAX_PATH);
  strcpy(SysLaunch, CurrentPath);
  strcat(SysLaunch, "\\GoogleChromePortable\\GoogleChromePortable.exe --start-maximized --app=\"");
  strcat(SysLaunch, CurrentPath);
  strcat(SysLaunch, "\\aifshe.html\"");

  printf("Starting Google Chrome...this may take a while...");

  PROCESS_INFORMATION pif;  //Gives info on the thread and..
                           //..process for the new process
  STARTUPINFO si;          //Defines how to start the program

  ZeroMemory(&si,sizeof(si)); //Zero the STARTUPINFO struct
  si.cb = sizeof(si);         //Must set size of structure

  BOOL bRet = CreateProcess(
        NULL, //Path to executable file
        SysLaunch,   //Command string - not needed here
        NULL,   //Process handle not inherited
        NULL,   //Thread handle not inherited
        FALSE,  //No inheritance of handles
        0,      //No special flags
        NULL,   //Same environment block as this prog
        NULL,   //Current directory - no separate path
        &si,    //Pointer to STARTUPINFO
        &pif);   //Pointer to PROCESS_INFORMATION

  if(bRet == FALSE)
  {
    MessageBox(HWND_DESKTOP,"Error: Unable to start Google Chrome.","",MB_OK);
    return 1;
  }

  WaitForInputIdle(pif.hProcess, INFINITE);

  CloseHandle(pif.hProcess);   //Close handle to process
  CloseHandle(pif.hThread);    //Close handle to thread

  return 0;
}
