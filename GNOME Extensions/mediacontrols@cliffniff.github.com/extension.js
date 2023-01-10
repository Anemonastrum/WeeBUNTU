const MediaControls = imports.misc.extensionUtils.getCurrentExtension().imports.widget.MediaControls;

let extension;

var init = () => {};

var enable = () => {
    log("[MediaControls] Enabling");
    extension = new MediaControls();
    extension.enable();
};

var disable = () => {
    log("[MediaControls] Disabling");
    extension.disable();
    extension = null;
};
