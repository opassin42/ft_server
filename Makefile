BG_BLUE	= \e[1;30;43m
BG_RED_BLINK	= \e[5;30;41m
BG_GREEN	= \e[1:30;42m
RE_COLOR	= \033[0m 

build: 
		@echo "$(BG_RED_BLINK)building image is processing. please wait...$(RE_COLOR)"
		@docker build -t ft_server . > log
		@echo "$(BG_GREEN)Image built !$(RE_COLOR)"
		@echo "$(BG_BLUE)Log saved in log file. make a cat command onto, for more details.$(RE_COLOR)"

run:
		@docker run -itd -p 80:80 -p 443:443 ft_server
		@echo "$(BG_RED_BLINK)Running project...$(RE_COLOR)"
		@echo "$(BG_GREEN)Run success. check the state container with docker ps -a$(RE_COLOR)"

log:
		@cat log | less


log_monitoring:		
		@tail -f log

stop_last_ctn:
		@echo "$(BG_RED_BLINK)stopping the last container...$(RE_COLOR)"
		@docker stop $$(docker ps -lq)
		@echo "$(BG_GREEN)Done.$(RE_COLOR)"

stop_all_ctn:
		@echo "$(BG_RED_BLINK)stopping all containers...$(RE_COLOR)"
		@docker stop $$(docker ps -aq)
		@echo "$(BG_GREEN)Done.$(RE_COLOR)"

rm_last_ctn:
		@echo "$(BG_RED_BLINK)removing the last created container...$(RE_COLOR)"
		@docker rm $$(docker ps -lq)
		@echo "$(BG_GREEN)Done.$(RE_COLOR)"

rm_all_ctn:
		@echo "$(BG_RED_BLINK)removing all containers...$(RE_COLOR)"
		@docker rm $$(docker ps -aq)
		@echo "$(BG_GREEN)Done.$(RE_COLOR)"

.PHONY: build, run, log, log_monitoring, stop_last_ctn, stop_all_ctn, rm_last_ctn. rm_all_ctn
