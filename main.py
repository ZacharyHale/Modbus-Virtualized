from pymodbus.client.sync import ModbusTcpClient
import time
from multiprocessing import Process, Value

client = ModbusTcpClient('127.0.0.1')


def loop_a(t):

    while 1:
        temperature = t.value
        client.write_register(1024, temperature)
        res = client.read_holding_registers(1024, 1)
        pr)
    client.close()

def loop_b(t):

    while 1:
        time.sleep(1)
        fan = client.read_coils(0, 1)
        if fan.bits[0] == 0:
            t.value += 1
        else:
            t.value -= 1

if __name__ == '__main__':
    print("started")
    temp = Value('i', 70)
    p1 = Process(target=loop_a, args=(temp,))
    p1.start()
    p2 = Process(target=loop_b, args=(temp,))
    p2.staint(res.registers[0]rt()
