import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {CartItem} from 'src/app/cart-item';
import {Product} from 'src/app/product';
import {CartService} from 'src/app/Services/cart.service';
import {UserService} from 'src/app/Services/user.service';

@Component({
  selector: 'app-list-products',
  templateUrl: './list-products.html',
  styleUrls: ['./list-products.css']
})
export class ListProducts implements OnInit {
  category!: string;
  products!: Product[];
  name!: string;
  page: number = 1;
  count: number = 0;
  tableSize: number = 7;

  constructor(private route: ActivatedRoute, private userService: UserService, private cartService: CartService, private router: Router) {

  }

  ngOnInit(): void {
    this.name = this.route.snapshot.params['name'];
    this.category = this.route.snapshot.params['category'];
    this.loadData();
  }

  loadData() {
    if (this.name?.length) {
      this.getProductByName();
    } else {
      this.getAllMedicines();
    }
  }

  onTableDataChange(event: any) {
    this.page = event;
  }

  getProductByName() {
    this.userService.getMedicineByName(this.name).subscribe({
      next: (data) => {
        this.products = data;
      }, error: (error) => {
        console.log(error);
        alert('No Medicines Found');
      }
    })
  }

  getAllMedicines() {
      this.userService.getAllMedicine().subscribe({
        next: (data) => {
          this.products = data;

        }, error: (error) => {
          console.log(error);
          alert('No Medicines Found');
        }
      })
  }

  onSearch(name: string) {
    if (name != undefined) {
      console.log('navigating to search url');
      let url = "/user/search/product/" + name;
      this.router.navigateByUrl(url);
      this.loadData();
    } else {
      console.log('please enter a name');
    }
  }

  sortByPriceLowToHigh() {
    this.products.sort((a, b) => a.price - b.price);
  }

  sortByPriceHighToLow() {
    this.products.sort((a, b) => b.price - a.price);
  }

  sortByNameAscending() {
    this.products.sort((a, b) => a.name.localeCompare(b.name));
  }

  sortByNameDescending() {
    this.products.sort((a, b) => b.name.localeCompare(a.name));
  }

  addToCart(product: Product) {
    const cartItem = new CartItem(product);
    this.cartService.addToCart(cartItem);
  }

}
