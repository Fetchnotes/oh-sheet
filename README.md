#iOS UIActionSheet plugin for Trigger

A (native Trigger.io plugin)[https://trigger.io/docs/current/api/native_plugins/index.html "native Trigger.io plugins"] that lets you use Apple's native UIActionSheet API in your Trigger/Forge web applications.

##Usage with Javascript

`onDestroy()` and `onCancel()` set up two functions, one each for the two buttons on the UIActionSheet (destructive button, cancel button… Support for more than two buttons is coming. Feel free to fork and pull request if you build it before I do.)
`forge.internal.call('actionsheet.show', { text: text, destructiveTitle: destructiveTitle, cancelTitle: cancelTitle }` displays a UIActionSheet with the values provided for text, destructive button title (`destructiveTitle`) and cancel button title (`cancelTitle`).
`forge.internal.addEventListener('actionsheet.destructive', onDestroy);` binds the onDestroy() function we set up earlier to the event thrown when the user taps the destructive button to dismiss the UIActionSheet. Replace `actionsheet.destructive` with `actionsheet.cancel` for the cancel event. Feel free to rename the onDestroy and onCancel functions.
  
  ```var onDestroy = function() {
    // Run this code upon tapping the destructive button
  };
  var onCancel = function() {
    // Run this code upon tapping the cancel button
  };
  
  forge.internal.call('actionsheet.show', {
    text: text,
    destructiveTitle: destructiveTitle,
    cancelTitle: cancelTitle
  }, function() {
    forge.internal.addEventListener('actionsheet.destructive', onDestroy);
    forge.internal.addEventListener('actionsheet.cancel', onCancel);
  });```
  
  ##License
  
  Copyright (c) 2013, Giles Van Gruisen
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met: 

  1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer. 
  2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution. 

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

  The views and conclusions contained in the software and documentation are those
  of the authors and should not be interpreted as representing official policies, 
  either expressed or implied, of the FreeBSD Project.
