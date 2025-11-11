import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { AnalyticsService } from '@/services/analytics.service';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterModule],
    template: `
        <router-outlet></router-outlet>`
})
export class AppComponent implements OnInit {

    constructor(
        private analyticsService: AnalyticsService
    ) {}

    ngOnInit() {
        this.analyticsService.trackEvent("app component loaded", "app component loaded successfully", "load");
    }

}
