import { createStore } from 'vuex'
import axios from './axios-auth';

const store = createStore({
  state: {
    products: [],
    cart: [],
    token: null,
    role: null,
    currentMenu: null
  },
  getters: {
    isAuthenticated(state) {
      return state.token != null;
    },

    isAdmin(state) {
      return state.role === 'admin';
    }
  },

  mutations: {
    loginSuccesful(state, parameters) {
      state.token = parameters.token;
      state.role = parameters.role;
    },

    SET_PRODUCTS(state, products) {
      state.products = products;
    },

    ADD_PRODUCT(state, product) {
      state.products.push(product);
    },
    
    REMOVE_ITEM(state, id) {
      state.products = state.products.filter((product) => product.id !== id);
    },

    ADD_TO_CART(state, {menu, amount}) {
      console.log('Amount:', amount);
      const existingItem = state.cart.find((item) => item.id === menu.id);
      if (existingItem) {
        existingItem.amount += amount; 
      } else {
        state.cart.push({
          ...menu,
          amount: amount, 
        });
      }
    },

    REMOVE_FROM_CART(state, id) {
      state.cart = state.cart.filter((item) => item.id !== id);
    },

    CLEAR_CART(state) {
      state.cart = [];
    },

    setCurrentMenu(state, menu) {
      state.currentMenu = menu;
    }
  },

  actions: {
    autoLogin({commit}) {
      let token = localStorage.getItem('token');
      let role = localStorage.getItem('role');

      if(token){
        axios.defaults.headers.common["Authorization"] = "Bearer " + token;

        commit('loginSuccesful', {
          token: token,
          role: role
        });
      }
    },

    login({commit}, parameters) {

      return new Promise((resolve, reject) => {
        axios.post("/users/login",{
          username: parameters.username,
          password: parameters.password
      })
      .then(result => {
      axios.defaults.headers.common["Authorization"] = "Bearer " + result.data.token;

      localStorage.setItem('token', result.data.token);
      localStorage.setItem('role', result.data.role);

      commit('loginSuccesful', {
        token: result.data.token,
        role: result.data.role
      });
      resolve()
  })
  .catch(error => reject(error));
})
  },

    register(_, parameters) {
      return new Promise((resolve, reject) => {
        axios
          .post("users/create", {
            username: parameters.username,
            email: parameters.email,
            password: parameters.password,
          })
          .then((result) => {
            axios.defaults.headers.common["Authorization"] =
              "Bearer " + result.data.token;
            resolve(result); 
          })
          .catch((error) => {
            console.log(error);
            reject(error);
          });
      });
    },

    edit(_, menu = {}) {
      return new Promise((resolve, reject) => {

        axios
          .put(`/products/${menu.id}`,{
            name: menu.name,
            description: menu.description,
            price: menu.price,
            stock: menu.stock,
            category: menu.category,
            image: menu.image, 
          })
          .then((response) => {
            console.log("Product updated:", response.data);
            resolve(response);  
          })
          .catch((error) => {
            console.error("Error during edit:", error.response || error.message);
            reject(error); 
          });
      });
    },

    buyProducts({ commit }, menu) {
      return new Promise((resolve, reject) => {
        if (menu && menu.items && Array.isArray(menu.items)) {
          menu.items.forEach((item) => {
            axios
              .put(`/products/${item.id}`, {
                name: item.name,
                description: item.description,
                price: item.price,
                stock: item.stock, 
                category: item.category,
                image: item.image,
              })
              .then((response) => {
                commit("updateProduct", response.data); 
              })
              .catch((error) => {
                console.error("Error during product update:", error);
                reject(error); 
              });
          });
    
          resolve();
        } else {
          reject("Invalid menu format");
        }
      });
    },
    
    async fetchProducts({ commit }) {
      try {
        const response = await axios.get('/products');
        commit('SET_PRODUCTS', response.data);
        return response.data;
      } catch (error) {
        console.error('Error fetching products:', error);
        throw error;
      }
    },
    

    async deleteItem({ commit }, id) {
      try {
        await axios.delete(`/products/${id}`);
        commit('REMOVE_ITEM', id);
      } catch (error) {
        console.error('Error deleting item:', error);
        throw error;
      }
    },    

    async addProduct({ commit }, product) {
      try {
        const response = await axios.post('products/create', {
          name: product.name,
          description: product.description,
          price: product.price,
          stock: product.stock,
          category: product.category,
          image: product.image,
        });
        commit('ADD_PRODUCT', response.data);
        return response.data; 
      } catch (error) {
        console.error('Error adding product:', error);
        throw error; 
      }
    },      
}
})
export default store;