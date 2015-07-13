package io.trigger.forge.android.modules.actionsheet;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeParam;
import io.trigger.forge.android.core.ForgeTask;
import android.app.AlertDialog;
import android.content.DialogInterface;

public class API {
	public static void show(final ForgeTask task,
			@ForgeParam("text") final String text,
			@ForgeParam("destructiveTitle") final String destructiveTitle,
			@ForgeParam("cancelTitle") final String cancelTitle){
		
		task.performUI(new Runnable(){
			@Override
			public void run() {
				new AlertDialog.Builder(ForgeApp.getActivity())
					.setTitle("")
					.setMessage(text)
					.setPositiveButton(destructiveTitle, new DialogInterface.OnClickListener() {
						public void onClick(DialogInterface dialog, int which) { 
							ForgeApp.event("actionsheet.destructive");
						}
					 })
					.setNegativeButton(cancelTitle, new DialogInterface.OnClickListener() {
						public void onClick(DialogInterface dialog, int which) { 
							ForgeApp.event("actionsheet.cancel");
						}
					 })
					.show();
			}});
		task.success();
	}
}
