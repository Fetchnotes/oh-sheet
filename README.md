# oh-sheet

A [native Trigger.io plugin](https://trigger.io/docs/current/api/native_plugins/index.html "native Trigger.io plugins") that lets you use Apple's native UIActionSheet API in your Trigger/Forge web applications.

## Usage

The following example displays a UIActionSheet and binds function to the destructive and cancel buttons.

### Javascript

  ```javascript
  // Declare function to bind to UIActionSheet's destructive button
  var onDestroy = function() {
    // Run this code upon tapping the destructive button
  };
  // Declare function to bind to UIActionSheet's cancel button
  var onCancel = function() {
    // Run this code upon tapping the cancel button
  };
  
  // Display the UIActionSheet
  forge.internal.call('actionsheet.show', {
    // with provided text and button titles
    text: text,
    destructiveTitle: destructiveTitle,
    cancelTitle: cancelTitle
  }, function() {
    // Bind onDestroy and onCancel to respective actionsheet events
    forge.internal.addEventListener('actionsheet.destructive', onDestroy);
    forge.internal.addEventListener('actionsheet.cancel', onCancel);
  });
  ```
  
  ### CoffeeScript

  ```coffeescript
  # Declare function to bind to UIActionSheet's destructive button
  onDestroy = () ->
    # Run this code upon tapping the destructive button
    
  # Declare function to bind to UIActionSheet's cancel button
  onCancel = () ->
    # Run this code upon tapping the cancel button
  
  # Display the UIActionSheet
  forge.internal.call 'actionsheet.show' ->
    # with provided text and button titles
    text: text
    destructiveTitle: destructiveTitle
    cancelTitle: cancelTitle
  , () ->
    # Bind onDestroy and onCancel to respective actionsheet events
    forge.internal.addEventListener 'actionsheet.destructive', onDestroy
    forge.internal.addEventListener 'actionsheet.cancel', onCancel
  ```
  
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
