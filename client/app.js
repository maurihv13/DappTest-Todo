App = {
    init: () => {
        console.log("Loaded")
        App.loadEthereum()
    },

    loadEthereum: async () => {
        if (window.ethereum) {
            // console.log("Ethereum existe")
            App.web3Provider = window.ethereum
            await window.ethereum.request({method: 'eth_requestAccounts'})
        } else if(window.web3) {
            web3 = new Web3(window.web3.currentProvider)
        } else {
            console.log("No ethereum browser is installed. Try installing Metamask")
        }
    },

    loadContracts: async () => {
        
    }


}

App.init()