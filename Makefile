# cocotb setup
export COCOTB_REDUCED_LOG_FMT=1
all: test_all test_pwm

test_all:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s top -s dump -g2012 src/pwm.v src/dump_top.v src/top.v src/encoder.v src/debounce.v
	MODULE=test_all vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp

test_pwm:
	rm -rf sim_build/
	mkdir sim_build/
	iverilog -o sim_build/sim.vvp -s pwm -s dump -g2012 src/pwm.v src/dump_pwm.v
	MODULE=test_pwm vvp -M $$(cocotb-config --prefix)/cocotb/libs -m libcocotbvpi_icarus sim_build/sim.vvp
