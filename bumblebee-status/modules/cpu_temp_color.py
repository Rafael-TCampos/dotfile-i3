#!/usr/bin/env python3
import subprocess
import re

def get_cpu_temp():
    try:
        output = subprocess.check_output(['sensors'], universal_newlines=True)
        temps = []
        # Pega todas as linhas com Core ou Package
        for line in output.splitlines():
            if 'Core' in line or 'Package id 0' in line:
                match = re.search(r'\+(\d+(\.\d+)?)°C', line)
                if match:
                    temps.append(float(match.group(1)))
        if temps:
            temp = max(temps)  # maior temperatura
            color = "#00FF00"  # verde
            if temp >= 70:
                color = "#FFFF00"  # amarelo
            if temp >= 85:
                color = "#FF0000"  # vermelho
            return f"%{{F{color}}}CPU {int(temp)}°C%{{F-}}"
        else:
            return "CPU ?°C"
    except Exception:
        return "CPU ?°C"

if __name__ == "__main__":
    print(get_cpu_temp())
