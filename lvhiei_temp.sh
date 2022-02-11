
function genrtc_android_project(){
    cmake -Bbuild_android -DBYTE_GEN_ANDROID=ON -DRTC_PLATFORM=android -DABI_FILTERS=arm64-v8a
}

function genrtc_ios_project(){
    cmake -GXcode -DRTC_PLATFORM=ios -Bbuild_ios
    cd build_ios
    pod install --repo-update
    open VolcEngine.xcworkspace
    cd ..
}

function genrtc_mac_project(){
    cmake -Bbuild_mac -GXcode 
    cd build_mac
    open VolcEngine.xcodeproj
    cd -
}

function genrtc_ut_project(){
    cmake -GXcode -Bbuild_test -DRTC_ENABLE_UNITTEST=ON
    cd build_test
    open VolcEngine.xcodeproj
    cd -
}

function readdep(){
    arm-linux-androideabi-readelf -a $1 | grep NEEDED
}
