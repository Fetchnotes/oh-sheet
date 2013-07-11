#iOS UIActionSheet plugin for Trigger


`forge.internal.call('actionsheet.show', {
  text: text,
  destructiveTitle: destructiveTitle,
  cancelTitle: cancelTitle
}, function() {
  forge.internal.addEventListener('actionsheet.destructive', onDestroy);
  return forge.internal.addEventListener('actionsheet.cancel', onCancel);
});`