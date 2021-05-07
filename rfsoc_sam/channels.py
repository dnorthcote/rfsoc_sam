__author__ = "David Northcote"
__organisation__ = "The Univeristy of Strathclyde"
__support__ = "https://github.com/strath-sdr/rfsoc_sam"

from pynq import DefaultHierarchy
from .spectrum_analyser import SpectrumAnalyser
from .bandwidth_selector import BandwidthSelector
from .controller import Controller
from .ofdm import OfdmTransmitter, OfdmReceiver
from .inspector import InspectorCore, DataInspector
from .transmitter_frontend import RadioTransmitterGUI
from .receiver_frontend import RadioAnalyserGUI


class AdcChannel(DefaultHierarchy):

    @staticmethod
    def checkhierarchy(description):
        spectrum_analyser = None
        decimator = None
        ofdm_receiver = None
                
        for ip, details in description['ip'].items():
            if details['driver'] == SpectrumAnalyser:
                spectrum_analyser = ip
            elif details['driver'] == BandwidthSelector:
                decimator = ip
            elif details['driver'] == OfdmReceiver:
                ofdm_receiver = ip
                
        return (spectrum_analyser is not None and
                decimator is not None and
                ofdm_receiver is not None)
    
    
    def __init__(self, description, tile=None, block=None, adc_description=None):
        super().__init__(description)
        self._tile = tile
        self._block = block
        self._adc_description = adc_description
        

    def _initialise_channel(self):
        self.frontend = RadioAnalyserGUI(adc_tile=self._tile,
                                         adc_block=self._block,
                                         adc_description=self._adc_description,
                                         spectrum_analyser=self.spectrum_analyser,
                                         decimator=self.decimator,
                                         ofdm_receiver=self.ofdm_receiver,
                                         inspector=self.DataInspector)

        
class DacChannel(DefaultHierarchy):
    
    @staticmethod
    def checkhierarchy(description):
        ofdm_transmitter = None
                
        for ip, details in description['ip'].items():
            if details['driver'] == OfdmTransmitter:
                ofdm_transmitter = ip
                
        return (ofdm_transmitter is not None)
    
    
    def __init__(self, description, tile=None, block=None):
        super().__init__(description)
        self._tile = tile
        self._block = block
        
    
    def _initialise_channel(self):
        self.frontend = RadioTransmitterGUI(dac_tile=self._tile,
                                            dac_block=self._block,
                                            ofdm_transmitter=self.ofdm_transmitter)
        