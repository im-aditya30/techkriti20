package org.techkriti.techkriti20;
import android.view.ViewTreeObserver;
import android.view.WindowManager;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }
  // protected void onCreate(Bundle savedInstanceState){
  //   super.onCreate(savedInstanceState);

  //   getWindows().setStatusBarColor(0x00000000);
  //   GeneratedPluginRegistrant.registerWith(this);
  //   ViewTreeObserver vto = getFlutterView().getViewTreeObserver();
  //   vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener(){
  //     @Override
  //     public void onGlobalLayout(){
  //       getFlutterView().getViewTreeObserver().removeOnGlobalLayoutListener(this);
  //       getWindows().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
  //     }
  //   });
  // }
}
