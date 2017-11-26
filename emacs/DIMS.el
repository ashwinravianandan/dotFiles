;;(ede-cpp-root-project "DIMS"
		      ;;:file ( "/home/ashwin/gitRepos/DeskInformationSystem-Server/src/DeskDataService/main.cpp" )
		      ;;:include-path '("/home/ashwin/gitRepos/DeskInformationSystem-Server/src/DeskDataServce" )
		      ;;:include-path (quote (
		      ;;		    "/../../src/Utils"
			;;		    "/../../src/RestFramework/include"
			;;		    "/../../src/DeskDataService/RequestHandlers"
			;;		    "/../../src/DeskDataService/include"
			;;		    "/../../src/DeskDataService/RequestVisitors"
			;;		    )
			;;		   )
		      ;;)
;;(ede-cpp-root-project "my project" :file "/home/ashwin/gitRepos/DeskInformationSystem-Server/src/CMakeLists.txt"
  ;;                    :include-path '("/RestFramework/include/RequestHandling"
    ;;                                  "/RestFramekwor/include/Rest"
      ;;                                "/DeskDataService/include"))
;;; Code:
(ede-cpp-root-project "my project" :file "/home/ashwin/gitRepos/DeskInformationSystem-Server/src/CMakeLists.txt"
                      :include-path '("/Utils" "/RestFramework/include/RequestHandling" "/RestFramework/include/Rest" "/RestFramework/Rest" "/DeskDataService/include"))
